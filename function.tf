locals {
  source_dir  = "src"
  file_suffix = ".js"
}

module "hello-lambda" {
  source       = "./modules/lambda"
  service_name = "terraform-session-demo"
  source_dir   = local.source_dir
  lambda_name  = "hello"
  file_suffix  = local.file_suffix
}


output "lambda" {
  value = module.hello-lambda.function_name
}

