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

variable "ubuntu_ami" {
  type    = string
  default = "ami-0b5d515300a819fd9"
}
