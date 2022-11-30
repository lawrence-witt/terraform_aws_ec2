resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidrblock
  availability_zone = var.availability_zone
  tags = {
    name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidrblock
  availability_zone = var.availability_zone
  tags = {
    name = "private_subnet"
  }
}
