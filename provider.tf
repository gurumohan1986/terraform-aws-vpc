terraform {
  required_version = ">= 1.1.0"

  cloud {
    organization = "${var.tfc_organization}"
    workspaces {
      name = "${var.tfc_workspace}"
    }
  }

  # backend "hcp" {
  #   # Specify your HCP configuration, for example:
  #   hostname  = "app.hcp.hashicorp.com"  # HCP's endpoint URL (should not be empty)
  #   api_token = "your-hcp-api-token"     # Token to authenticate with HCP
  #   region    = "us-west"                 # Specify your HCP region if necessary
  # }

  required_providers {
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "~> 5.0"
    # }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  
}

# Configure the AWS Provider
# provider "aws" {
#   region     = var.aws_region
#   # access_key = var.AWS_ACCESS_KEY_ID
#   # secret_key = var.AWS_SECRET_ACCESS_KEY
# }

