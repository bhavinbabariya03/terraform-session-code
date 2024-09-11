variable "service_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "staging"
}

variable "runtime" {
  type    = string
  default = "nodejs18.x"
}

variable "lambda_name" {
  type = string
}

variable "source_dir" {
  type = string
}

variable "file_suffix" {
  type    = string
  default = ".js"
}