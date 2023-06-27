# Environment Variables
variable "project_name" {}
variable "environment" {}

# EC2 Variables
variable "ec2_security_group_id" {
  type = string
}
variable "public_subnet_az1_id" {
  type = string
}
variable "public_subnet_az2_id" {
  type = string
}
variable "private_app_subnet_az1_id" {
  type = string
}
variable "private_app_subnet_az2_id" {
  type = string
}
