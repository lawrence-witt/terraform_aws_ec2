resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidrblock
  tags = {
    name = "vpc"
  }
}

