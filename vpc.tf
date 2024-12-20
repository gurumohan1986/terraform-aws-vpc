resource "aws_vpc" "main" {
  cidr_block = var.cidr_block #"10.0.0.0/16" #var.cidr_block

  tags = var.main_vpc_tags
}

resource "aws_subnet" "main" {
  vpc_id     = "vpc-095217a8eb0fda76a" #aws_vpc.main.id
  cidr_block = "172.31.100.0/24" #var.public_subnet_cidr_block

  tags = var.public_subnet_tags
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_tls"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
  tags = {
    Name = "Allow SSH"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-0e2c8caa4b6378d8c" # us-west-2
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_ssh.id]

  # provisioner "file" {
  #   source="/Users/gurumohan/github/terraform-aws-vpc/scripts/script.sh"
  #   destination="/home/script.sh"
  # }

  connect (
    
  )
  provisioner "remote-exec" {
    inline=[
    "sudo apt-get update",
    "sudo apt-get install node -y",
    "sudo apt-get install npm -y",
    "sudo apt install mysql-client-core-8.0",
    "sudo apt install openjdk-17-jdk -y"
    ]
  }

  tags = {
    Name = "First Instance"
  }

}