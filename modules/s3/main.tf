# Create S3 Bucket
resource "aws_s3_bucket" "backend_s3_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "${var.project_name}-${var.environment}-s3-bucket"
    Environment = var.environment
  }
}

# Object Ownership
resource "aws_s3_bucket_ownership_controls" "object_ownership" {
  bucket = aws_s3_bucket.backend_s3_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Block Public Access
resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.backend_s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Bucket Versioning
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.backend_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Default Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "sse_encryption" {
  bucket = aws_s3_bucket.backend_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}
