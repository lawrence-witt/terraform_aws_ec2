resource "aws_security_group" "db_security_group" {
  depends_on = [
    var.vpc,
    var.public_subnet,
    var.private_subnet,
    aws_security_group.api_security_group,
    aws_security_group.bastion_security_group
  ]

  description = "Database Server Security Group"
  tags = {
    name = "db_security_group"
  }
  vpc_id = var.vpc.id

  ingress {
    description     = "Private HTTP Access"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.api_security_group.id]
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
