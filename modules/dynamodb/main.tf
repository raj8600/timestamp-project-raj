resource "aws_dynamodb_table" "timestamp_table" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.first_attribute
  range_key      = var.second_attribute

  attribute {
    name = var.first_attribute
    type = "S"
  }

  attribute {
    name = var.second_attribute
    type = "S"
  }
}
