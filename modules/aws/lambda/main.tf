######################################################
# CloudWatch Log Group
######################################################
resource "aws_cloudwatch_log_group" "main" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 3
}

######################################################
# Lambda Function
######################################################
data "archive_file" "main" {
  type             = "zip"
  source_file      = var.lambda_function_source_file
  output_file_mode = var.output_file_mode
  output_path      = var.lambda_function_output_path
}

resource "aws_lambda_function" "main" {
  filename      = var.lambda_function_output_path
  function_name = var.lambda_function_name
  role          = var.lambda_function_role_arn
  handler       = var.lambda_function_handler
  runtime       = var.lambda_runtime
  timeout       = var.lambda_timeout

  environment {
    variables = var.lambda_function_environment_variables
  }

  source_code_hash = data.archive_file.main.output_base64sha256

  # TODO: Update module to pass depends on resources?
  # depends_on = []
}
