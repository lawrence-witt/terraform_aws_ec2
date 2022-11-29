output "bastion_server_public_ip" {
  value = aws_eip.ec2_bastion_server_ip.public_ip
}

output "api_server_public_ip" {
  value = aws_eip.ec2_api_server_ip.public_ip
}

output "api_server_private_ip" {
  value = aws_instance.ec2_api_server.private_ip
}

output "db_server_private_ip" {
  value = aws_instance.ec2_db_server.private_ip
}
