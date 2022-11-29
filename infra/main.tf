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

module "instances" {
  source                 = "./modules/instances"
  public_subnet          = module.network.public_subnet
  private_subnet         = module.network.private_subnet
  api_security_group     = module.security.api_security_group
  db_security_group      = module.security.db_security_group
  bastion_security_group = module.security.bastion_security_group
  ssh_pub_key            = var.ssh_pub_key
}
