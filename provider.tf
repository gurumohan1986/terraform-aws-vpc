terraform {
  required_version = ">= 1.1.0"
  # cloud {
  #   organization = "mudragiri"
  #   workspaces {
  #     tags = "my_app"
  #   }
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  
}

# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
  # access_key = var.AWS_ACCESS_KEY_ID
  # secret_key = var.AWS_SECRET_ACCESS_KEY
}