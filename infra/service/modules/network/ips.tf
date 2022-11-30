resource "aws_eip" "ngw-eip" {
  vpc = true
  tags = {
    name = "nat_gateway_elastic_ip"
  }
}
