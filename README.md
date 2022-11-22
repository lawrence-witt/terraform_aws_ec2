# Terraform AWS EC2 #

Securely deploying a containerized Go HTTP server and Postgres Database to AWS using Terraform.

To achieve this I will:

1. Provision a VPC in AWS so that we can control public and private network access.
2. Provision public and private subnets for the VPC.
3. Route the public subnet to an Internet Gateway, route the private subnet to a NAT Gateway.
4. Provision an EC2 instance on the private network.