resource "aws_security_group" "api_security_group" {
  depends_on = [
    var.vpc,
    var.public_subnet,
    var.private_subnet,
    aws_security_group.bastion_security_group
  ]

  description = "API Server Security Group"
  tags = {
    name = "api_security_group"
  }
  vpc_id = var.vpc.id

  ingress {
    description = "Public HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [local.all_ips]
  }

  ingress {
    description     = "Private SSH Access"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_security_group.id]
  }

  egress {
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.all_ips]
  }
}
