data "aws_iam_policy_document" "main_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = var.assume_role_identifiers
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "main_permissions" {
  dynamic "statement" {
    for_each = var.iam_policy_statements
    content {
      effect = statement.value.effect
      actions = statement.value.actions
      resources = statement.value.resources
    }
  }
}

resource "aws_iam_policy" "main" {
  name        = "${var.iam_name_prefix}-policy"
  path        = "/"
  description = var.iam_policy_description
  policy      = data.aws_iam_policy_document.main_permissions.json
}

resource "aws_iam_role_policy_attachment" "main" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.main.arn
}

resource "aws_iam_role" "main" {
  name               = "${var.iam_name_prefix}-role"
  assume_role_policy = data.aws_iam_policy_document.main_assume_role.json
}
