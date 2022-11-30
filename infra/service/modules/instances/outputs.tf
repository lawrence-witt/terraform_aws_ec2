output "bastion_public_ip" {
  value = aws_eip.ec2_bastion_ip.public_ip
}

output "api_public_ip" {
  value = aws_eip.ec2_api_ip.public_ip
}

output "api_private_ip" {
  value = aws_instance.ec2_api_server.private_ip
}

output "db_private_ip" {
  value = aws_instance.ec2_db_server.private_ip
}

output "db_instance_id" {
  value = aws_instance.ec2_db_server.id
}
