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
      name = "terraform-aws-ec2-server"
    }
  }

  required_version = ">= 1.1.0"
}
