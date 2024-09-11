locals {
  function_name = "${var.environment}-${var.service_name}-${var.lambda_name}"
}


data "archive_file" "lambda" {
  type = "zip"
  #   source_file = "src/hello.js"
  source_file = "${var.source_dir}/${var.lambda_name}${var.file_suffix}"
  #   output_path = "hello.zip"
  output_path = "${var.lambda_name}.zip"
}

resource "aws_lambda_function" "lambda" {
  filename         = data.archive_file.lambda.output_path
  function_name    = local.function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = "${var.lambda_name}.handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = var.runtime
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_role" {
  name_prefix        = local.function_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "lambda" {
  name = "lambda-permissions"
  role = aws_iam_role.lambda_role.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
