

resource "aws_vpc" "first" {
  cidr_block = var.cidr_block

  tags = var.main_vpc_tags
}


resource "aws_route_table" "local" {
  vpc_id = aws_vpc.first.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = var.cidr_block
    gateway_id = "local"
  }

  tags = var.route_table_local_tags
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.first.id
  cidr_block = var.public_subnet_cidr_block

  tags = var.public_subnet_tags
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.first.id
  cidr_block = var.private_subnet_cidr_block

  tags = var.private_subnet_tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.first.id

  tags = {
    Name = "Default Internet Gateway"
  }
}

resource "aws_route_table" "internet_gateway" {
  vpc_id = aws_vpc.first.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = var.route_table_internet_tags
}

resource "aws_route_table_association" "internet_route_table" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.internet_gateway.id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_tls"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.first.id

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  } // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow SSH"
  }
}

resource "aws_instance" "public_ec2" {
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = var.public_ip_required
  ami                         = var.ami
  instance_type               = var.instance_type

  security_groups = [aws_security_group.allow_ssh.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y openjdk-17-jdk
              java -version
              EOF

  key_name = "guru"

  tags = {
    Name = "First EC2 Instance"
  }

}