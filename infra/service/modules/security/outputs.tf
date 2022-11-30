output "api_security_group" {
  value = aws_security_group.api_security_group
}

output "bastion_security_group" {
  value = aws_security_group.bastion_security_group
}

output "db_security_group" {
  value = aws_security_group.db_security_group
}
