resource "aws_instance" "ec2_bastion_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet.id

  key_name = aws_key_pair.ec2_bastion_key_pair.key_name

  vpc_security_group_ids = [var.bastion_security_group.id]

  tags = {
    name = "ec2_bastion_server"
  }
}

resource "aws_eip" "ec2_bastion_ip" {
  instance = aws_instance.ec2_bastion_server.id
  vpc      = true
  tags = {
    name = "ec2_bastion_ip"
  }
}

resource "aws_key_pair" "ec2_bastion_key_pair" {
  key_name   = var.ssh_key_name
  public_key = var.ssh_pub_key
  tags = {
    name = var.ssh_key_name
  }
}
