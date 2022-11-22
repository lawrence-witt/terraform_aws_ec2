resource "aws_security_group" "db_server_security_group" {
  depends_on = [
    var.vpc,
    var.public_subnet,
    var.private_subnet,
    aws_security_group.web_server_security_group
  ]

  description = "Private Database Security Group"
  tags = {
    name = "db_server_security_group"
  }
  vpc_id = var.vpc.id

  ingress {
    description     = "DB Access"
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = "tcp"
    security_groups = [aws_security_group.web_server_security_group.id]
  }

  egress {
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.all_ips]
  }
}
