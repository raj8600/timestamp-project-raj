/*
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
*/

# Configure the AWS Provider
provider "aws" {
  region     = var.region
   access_key = "AKIASHJI44723VG4GHMH"
  secret_key = "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"

}
