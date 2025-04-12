variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key"
  type        = string
  default     = ""
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS secret access key"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "Region of the AWS where you want to privision infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "tfc_organization" {
  description = "Organization of the Terraform Cloud"
  type        = string
  default     = "mudragiri"
}

variable "tfc_workspace" {
  description = "Workspace of the Terraform Cloud"
  type        = string
  default     = ""

  validation {
    condition     = var.tfc_workspace != ""
    error_message = "Please pass the valid Terraform Cloud Workspace Name ...!"
  }
}
variable "cidr_block" {
  description = "CIDR range for the VPC that you wanted to create"
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR range for the Public Subnet that you wanted to create"
  type        = string
  default     = ""
}

variable "private_subnet_cidr_block" {
  description = "CIDR range for the Private Subnet that you wanted to create"
  type        = string
  default     = ""
}

variable "main_vpc_tags" {
  description = "Tags for the VPC that you wanted to create"
  type        = map(any)
  default     = {}
}

variable "route_table_local_tags" {
  description = "Tags for the Local Route Table that you wanted to create"
  type        = map(any)
  default     = {}
}

variable "route_table_internet_tags" {
  description = "Tags for the Internet Route Table that you wanted to create"
  type        = map(any)
  default     = {}
}

variable "public_subnet_tags" {
  description = "Tags for the Public Subnet that you wanted to create"
  type        = map(any)
  default     = {}
}

variable "private_subnet_tags" {
  description = "Tags for the Private Subnet that you wanted to create"
  type        = map(any)
  default     = {}
}

variable "ami" {
  description = "Amazon Machine Image for the region"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "EC2 instance_type you are trying to provision"
  type        = string
  default     = "t2.micro"
}

variable "public_ip_required" {
  description = "Is public ip required for your EC2 ?"
  type        = bool
  default     = false
}
