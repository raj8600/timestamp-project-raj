# Create VPC
module "vpc" {
  source                      = "./modules/vpc"
  region                      = var.region
  project_name                = var.project_name
  environment                 = var.environment
  vpc_cidr                    = var.vpc_cidr
  public_subnet_az1_cidr      = var.public_subnet_az1_cidr
  public_subnet_az2_cidr      = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr = var.private_app_subnet_az2_cidr
}

# Create Nat Gateway
module "nat-gateway" {
  source                    = "./modules/nat-gateway"
  project_name              = module.vpc.project_name
  environment               = module.vpc.environment
  vpc_id                    = module.vpc.vpc_id
  internet_gateway          = module.vpc.internet_gateway
  public_subnet_az1_id      = module.vpc.public_subnet_az1_id
  public_subnet_az2_id      = module.vpc.public_subnet_az2_id
  private_app_subnet_az1_id = module.vpc.private_app_subnet_az1_id
  private_app_subnet_az2_id = module.vpc.private_app_subnet_az2_id
  ec2_az1_id                = module.ec2.ec2_az1_id
  ec2_az2_id                = module.ec2.ec2_az2_id
}

# Create Security Group
module "security-group" {
  source       = "./modules/security-group"
  project_name = module.vpc.project_name
  environment  = module.vpc.environment
  vpc_id       = module.vpc.vpc_id
}

# Create EC2 Instance
module "ec2" {
  source                    = "./modules/ec2"
  project_name              = module.vpc.project_name
  environment               = module.vpc.environment
  ec2_security_group_id     = module.security-group.ec2_security_group_id
  public_subnet_az1_id      = module.vpc.public_subnet_az1_id
  public_subnet_az2_id      = module.vpc.public_subnet_az2_id
  private_app_subnet_az1_id = module.vpc.private_app_subnet_az1_id
  private_app_subnet_az2_id = module.vpc.private_app_subnet_az2_id
}

# Create Application Load Balancer
module "alb" {
  source                = "./modules/alb"
  project_name          = module.vpc.project_name
  environment           = module.vpc.environment
  vpc_id                = module.vpc.vpc_id
  alb_security_group_id = module.security-group.alb_security_group_id
  public_subnet_az1_id  = module.vpc.public_subnet_az1_id
  public_subnet_az2_id  = module.vpc.public_subnet_az2_id
  private_ec2_az1_id    = module.ec2.private_ec2_az1_id
  private_ec2_az2_id    = module.ec2.private_ec2_az2_id
}

# create dynamodb 
module "dynamodb" {
  source           = "./modules/dynamodb"
  table_name       = var.table_name
  billing_mode     = var.billing_mode
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity
  first_attribute  = var.first_attribute
  second_attribute = var.second_attribute
}

# create lambda 

module "lambda" {
  source = "./modules/lambda"
  # filename         = var.filename
  function_name    = var.function_name
  role_name        = var.role_name
  runtime          = var.runtime
  handler          = var.handler
  source-file-path = "${var.source-file-path}/lambdacode.py"
}

module "api" {
  source      = "./modules/api-gateway"
  lambda_arn  = module.lambda.lambda_arn_output
  api_name    = var.api_name
  description = var.description
  method      = var.api_http_method
}

# Create S3 Bucket
module "s3" {
  source       = "./modules/s3"
  project_name = module.vpc.project_name
  environment  = module.vpc.environment
  bucket_name  = var.bucket_name
}

