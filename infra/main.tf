provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "network" {
  source = "./modules/network"
  region = var.region
}

module "security" {
  source         = "./modules/security"
  vpc            = module.network.vpc
  public_subnet  = module.network.public_subnet
  private_subnet = module.network.private_subnet
}

# Public Bastion Server

resource "aws_instance" "ec2_bastion_server" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  subnet_id     = module.network.public_subnet.id

  key_name = aws_key_pair.ec2_bastion_key_pair.key_name

  vpc_security_group_ids = [module.security.bastion_server_security_group.id]

  tags = {
    name = "ec2_bastion_server"
  }
}

resource "aws_eip" "ec2_bastion_server_ip" {
  instance = aws_instance.ec2_bastion_server.id
  vpc      = true
  tags = {
    name = "bastion_server_ip"
  }
}

resource "aws_key_pair" "ec2_bastion_key_pair" {
  key_name   = var.ssh_key_name
  public_key = var.ssh_pub_key
  tags = {
    name = var.ssh_key_name
  }
}

# Public API Server

resource "aws_instance" "ec2_api_server" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  subnet_id     = module.network.public_subnet.id

  key_name = aws_key_pair.ec2_bastion_key_pair.key_name

  vpc_security_group_ids = [module.security.api_server_security_group.id]

  tags = {
    name = "ec2_api_server"
  }
}

resource "aws_eip" "ec2_api_server_ip" {
  instance = aws_instance.ec2_api_server.id
  vpc      = true
  tags = {
    name = "api_server_ip"
  }
}

# Private DB Server

resource "aws_instance" "ec2_db_server" {
  depends_on = [
    aws_instance.ec2_api_server
  ]

  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  subnet_id     = module.network.private_subnet.id

  key_name = aws_key_pair.ec2_bastion_key_pair.key_name

  vpc_security_group_ids = [module.security.db_server_security_group.id]

  tags = {
    name = "ec2_db_server"
  }
}
