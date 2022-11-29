variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ubuntu_ami" {
  type    = string
  default = "ami-09a2a0f7d2db8baca"
}

variable "ssh_key_name" {
  type    = string
  default = "ssh_key_pair"
}

variable "ssh_pub_key" {
  type = string
}
