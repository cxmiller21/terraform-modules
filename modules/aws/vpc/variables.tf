variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "vpc_name" {
  type = string
}

# Public Subnets
variable "enable_public_subnets" {
  type    = bool
  default = false
}

variable "public_1_cidr" {
  type    = string
  default = "10.10.10.0/24"
}

variable "public_2_cidr" {
  type    = string
  default = "10.10.20.0/24"
}

variable "private_1_cidr" {
  type    = string
  default = "10.10.30.0/24"
}

variable "private_2_cidr" {
  type    = string
  default = "10.10.40.0/24"
}
