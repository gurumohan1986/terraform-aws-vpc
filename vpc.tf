resource "aws_vpc" "main" {
  cidr_block = var.cidr_block #"10.0.0.0/16" #var.cidr_block

  tags = var.main_vpc_tags
}

resource "aws_subnet" "main" {
  vpc_id     = "vpc-095217a8eb0fda76a" #aws_vpc.main.id
  cidr_block = "172.31.10.0/24" #var.public_subnet_cidr_block

  tags = var.public_subnet_tags
}

resource "aws_instance" "foo" {
  ami           = "ami-0e2c8caa4b6378d8c" # us-west-2
  instance_type = "t2.micro"

  provisioner "file" {
  source="/Users/gurumohan/github/terraform-aws-vpc/scripts/script.sh"
  destination="/tmp/script.sh"
}

provisioner "remote-exec" {
  inline=[
  "sudo chmod +x /tmp/script.sh",
  "sudo /tmp/script.sh"
  ]
}

}