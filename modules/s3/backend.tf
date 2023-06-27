# Store the terraform state file in S3 
terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = "path/to/my/key"
    region         = "eu-west-1"
  }
}
