# output "vpc" {
#   value = aws_vpc.main
# }

output "access_key" {
  value = var.AWS_ACCESS_KEY_ID
}

output "secret_key" {
  value = var.AWS_SECRET_ACCESS_KEY
}