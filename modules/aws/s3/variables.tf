variable "bucket_name" {
  type = string
}

variable "bucket_acl" {
  type        = string
  default     = "private"
}

variable "force_destroy" {
  type = bool
  default = false
  description = "Empty the bucket before destroying it"
}
