output "api_server_security_group" {
  value = aws_security_group.api_server_security_group
}

output "bastion_server_security_group" {
  value = aws_security_group.bastion_server_security_group
}

output "db_server_security_group" {
  value = aws_security_group.db_server_security_group
}
