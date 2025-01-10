output "vpc" {
  value = aws_vpc.first
}

output "route_table_default" {
  value = data.aws_route_table.default
}

output "public_subnet" {
  value = aws_subnet.public
}

output "private_subnet" {
  value = aws_subnet.private
}

output "route_table_internet" {
  value = aws_route_table.internet_gateway
}

output "internet_gateway" {
  value = aws_internet_gateway.main
}

output "ssh_security_group" {
  value = aws_security_group.allow_ssh
}

output "ec2" {
  value = aws_instance.public_ec2
}