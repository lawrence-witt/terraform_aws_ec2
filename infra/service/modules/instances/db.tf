resource "aws_instance" "ec2_db_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet.id

  key_name = aws_key_pair.ec2_bastion_key_pair.key_name

  vpc_security_group_ids = [var.db_security_group.id]

  tags = {
    name = "ec2_db_server"
  }
}
