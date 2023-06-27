# Environment Variables
variable "project_name" {}
variable "environment" {}

# ALB Variables
variable "vpc_id" {}
variable "alb_security_group_id" {}
variable "public_subnet_az1_id" {}
variable "public_subnet_az2_id" {}
variable "private_ec2_az1_id" {}
variable "private_ec2_az2_id" {}
