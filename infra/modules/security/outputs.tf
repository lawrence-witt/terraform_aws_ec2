output "web_server_security_group" {
  value = aws_security_group.web_server_security_group
}

output "db_server_security_group" {
  value = aws_security_group.db_server_security_group
}
