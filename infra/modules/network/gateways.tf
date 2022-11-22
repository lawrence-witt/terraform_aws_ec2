resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "internet_gateway"
  }
}

resource "aws_nat_gateway" "ngw" {
  subnet_id     = aws_subnet.public_subnet.id
  allocation_id = aws_eip.ngw-eip.id
  depends_on = [
    aws_internet_gateway.igw
  ]
  tags = {
    name = "nat_gateway"
  }
}
