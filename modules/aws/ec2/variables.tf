variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_id" {
  type = string
  description = "Update to allow a VPC ID to be passed in"
  default = ""
}

variable "subnet_id" {
  type = string
  description = "Update to allow a subnet ID to be passed in"
}

variable "security_group_ids" {
  type = list(string)
  description = "Update to allow a list of security group IDs to be passed in"
  default = []
}
