resource "aws_security_group" "bastion_server_security_group" {
  depends_on = [
    var.vpc,
    var.public_subnet,
    var.private_subnet
  ]

  description = "Bastion Server Security Group"
  tags = {
    name = "bastion_server_security_group"
  }
  vpc_id = var.vpc.id

  ingress {
    description = "Public SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.all_ips]
  }

  egress {
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.all_ips]
  }
}
