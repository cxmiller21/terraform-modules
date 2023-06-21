variable "lambda_function_source_file" {
  type        = string
  description = "The path to the source code of the Lambda function"
}

variable "output_file_mode" {
  type        = string
  description = "The file mode of the output file"
  default     = "644"
}

variable "lambda_function_output_path" {
  type        = string
  description = "The path to the output file"
}

variable "lambda_function_name" {
  type        = string
  description = "The name of the Lambda function"
}

variable "lambda_function_role_arn" {
  type       = string
  description = "The ARN of the IAM role to use for the Lambda function"
}

variable "lambda_function_handler" {
  type        = string
  description = "The name of the Lambda function handler"
  default     = "lambda.lambda_handler"
}

variable "lambda_runtime" {
  type        = string
  description = "The runtime to use for the Lambda function"
  default     = "python3.10"
}

variable "lambda_timeout" {
  type        = number
  description = "The timeout for the Lambda function"
  default     = 15
}

variable "lambda_function_environment_variables" {
  type        = map(string)
  description = "The environment variables for the Lambda function"
  default     = {}
}
