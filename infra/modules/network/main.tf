resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidrblock
  enable_dns_hostnames = true
  tags = {
    name = "vpc"
  }
}

