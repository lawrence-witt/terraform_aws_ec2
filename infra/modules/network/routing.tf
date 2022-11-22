resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "public_route_table"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet.id
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = local.all_ips
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "private_route_table"
  }
}

resource "aws_route_table_association" "private_route_table_association" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet.id
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.public_route_table.id
  nat_gateway_id         = aws_nat_gateway.ngw.id
  destination_cidr_block = local.all_ips
}
