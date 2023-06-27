# Environment Variables
variable "region" {}
variable "project_name" {}
variable "environment" {}

# VPC Variables
variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}

# S3 Variables
variable "bucket_name" {}

# DynamoDB Variables
variable "table_name" {
  type    = string
  default = "DynamoDB-Timestamp"
}

variable "billing_mode" {
  type    = string
  default = "PROVISIONED"
}

variable "read_capacity" {
  type    = number
  default = 10
}

variable "write_capacity" {
  type    = number
  default = 10
}

variable "first_attribute" {
  type    = string
  default = "ID"
}

variable "second_attribute" {
  type    = string
  default = "Time"
}

#lambda variables

variable "function_name" {
  type    = string
  default = "timestamp_lambda"
}

variable "runtime" {
  type    = string
  default = "python3.9"
}

variable "handler" {
  type    = string
  default = "lambdacode.lambda_handler"
}

variable "role_name" {
  type    = string
  default = "aws_lambda_role_for_ts_app"
}

variable "source-file-path" {
  type    = string
  default = "./modules/lambda/"
}

variable "lambda_arn" {
  type    = string
  default = "NULL"
}
# api variable

variable "api_deployment_arn" {
  type    = string
  default = null
}
variable "api_name" {
  type    = string
  default = "TimestampApi"

}
variable "description" {
  type    = string
  default = "API for timestamp insertion"
}
variable "api_http_method" {
  type    = string
  default = "GET"

}
