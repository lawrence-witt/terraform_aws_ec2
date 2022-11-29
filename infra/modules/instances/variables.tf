variable "public_subnet" {
  type = object({
    id = string
  })
}

variable "private_subnet" {
  type = object({
    id = string
  })
}

variable "api_security_group" {
  type = object({
    id = string
  })
}

variable "db_security_group" {
  type = object({
    id = string
  })
}

variable "bastion_security_group" {
  type = object({
    id = string
  })
}

variable "instance_ami" {
  type    = string
  default = "ami-09a2a0f7d2db8baca"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_key_name" {
  type    = string
  default = "ssh_key_pair"
}

variable "ssh_pub_key" {
  type = string
}
