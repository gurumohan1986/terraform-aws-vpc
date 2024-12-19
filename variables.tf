variable "aws_region" {
  description = "Region of the AWS where you want to privision infrastructure"
  type        = string
  default     = "" #"us-east-1"
}

variable "cidr_block" {
  description = "CIDR range for the VPC that you wanted to create"
  type = string
  default = ""
}

variable "main_vpc_tags" {
  description = "Tags for the VPC that you wanted to create"
  type = map
  default = {}
}