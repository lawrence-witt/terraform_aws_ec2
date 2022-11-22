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

resource "aws_instance" "ec2_web_server" {
  ami           = var.ubuntu_ami
  instance_type = "t2.micro"
  subnet_id     = module.network.public_subnet.id

  vpc_security_group_ids = [module.security.web_server_security_group.id]

  tags = {
    name = "ec2_web_server"
  }
}

resource "aws_eip" "ec2_web_server_ip" {
  instance = aws_instance.ec2_web_server.id
  vpc      = true
  tags = {
    name = "web_server_ip"
  }
}

resource "aws_instance" "ec2_db_server" {
  depends_on = [
    aws_instance.ec2_web_server
  ]

  ami           = var.ubuntu_ami
  instance_type = "t2.micro"
  subnet_id     = module.network.private_subnet.id

  vpc_security_group_ids = [module.security.db_server_security_group.id]

  tags = {
    name = "ec2_db_server"
  }
}
