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

variable "availability_zone" {
  type    = string
  default = "eu-west-2a"
}

variable "ssh_pub_key" {
  type = string
}
