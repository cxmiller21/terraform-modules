output "iam_role_name" {
  value = aws_iam_role.main.name
}

output "iam_role_arn" {
  value = aws_iam_role.main.arn
}

output "iam_policy_arn" {
  value = aws_iam_policy.main.arn
}
