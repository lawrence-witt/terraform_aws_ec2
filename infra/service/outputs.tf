output "bastion_public_ip" {
  value = module.instances.bastion_public_ip
}

output "api_public_ip" {
  value = module.instances.api_public_ip
}

output "api_private_ip" {
  value = module.instances.api_private_ip
}

output "db_private_ip" {
  value = module.instances.db_private_ip
}

output "db_instance_id" {
  value = module.instances.db_instance_id
}
