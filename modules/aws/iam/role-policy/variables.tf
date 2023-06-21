variable "assume_role_identifiers" {
  type       = list(string)
  description = "The identifiers of the principals to allow to assume the role"
}

variable "iam_policy_statements" {
  type        = list(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))
  description = "The statements to include in the IAM policy"
}

variable "iam_name_prefix" {
  type        = string
  description = "The prefix to use for the IAM policy and role names"
}

variable "iam_policy_description" {
  type        = string
  description = "The description to use for the IAM policy"
  default = ""
}
