output "web_server_public_ip" {
  value = aws_instance.ec2_web_server.public_ip
}
