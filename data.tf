data "aws_route_table" "default" {
  vpc_id = aws_vpc.first.id

  filter {
    name   = "association.main"
    values = [true]
  }
}
