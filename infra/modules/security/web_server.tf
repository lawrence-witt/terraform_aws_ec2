resource "aws_security_group" "web_server_security_group" {
  depends_on = [
    var.vpc,
    var.public_subnet,
    var.private_subnet
  ]

  description = "Public Web Server Security Group"
  tags = {
    name = "web_server_security_group"
  }
  vpc_id = var.vpc.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [local.all_ips]
  }

  ingress {
    description = "SSH"
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
