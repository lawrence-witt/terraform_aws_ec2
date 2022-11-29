variable "vpc" {
  type = object({
    id = string
  })
}

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
