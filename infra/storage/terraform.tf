terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  cloud {
    organization = "lawrence_witt_test"
    workspaces {
      name = "terraform_aws_ec2_storage"
    }
  }

  required_version = ">= 1.1.0"
}
