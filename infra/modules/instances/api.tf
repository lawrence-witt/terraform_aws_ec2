resource "aws_instance" "ec2_api_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet.id

  key_name = aws_key_pair.ec2_bastion_key_pair.key_name

  vpc_security_group_ids = [var.api_security_group.id]

  tags = {
    name = "ec2_api_server"
  }
}

resource "aws_eip" "ec2_api_ip" {
  instance = aws_instance.ec2_api_server.id
  vpc      = true
  tags = {
    name = "ec2_api_ip"
  }
}
