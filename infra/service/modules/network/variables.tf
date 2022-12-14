variable "region" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "vpc_cidrblock" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrblock" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidrblock" {
  type    = string
  default = "10.0.2.0/24"
}
