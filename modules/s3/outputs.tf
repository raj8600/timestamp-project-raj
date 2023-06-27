# Export Backend S3 Bucket ID
output "backend_s3_id" {
  value = aws_s3_bucket.backend_s3_bucket.id
}
