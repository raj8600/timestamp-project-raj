# Environment Variables
variable "project_name" {}
variable "environment" {}

# Nat Gateway Variables
variable "vpc_id" {}
variable "internet_gateway" {}
variable "public_subnet_az1_id" {}
variable "public_subnet_az2_id" {}
variable "private_app_subnet_az1_id" {
    type = string
}
variable "private_app_subnet_az2_id" {
    type = string
}

variable "ec2_az1_id" {}
variable "ec2_az2_id" {}
