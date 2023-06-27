# Export the Region
output "region" {
  value = var.region
}

# Export the Project Name
output "project_name" {
  value = var.project_name
}

# Export the Environment
output "environment" {
  value = var.environment
}

# Export the VPC ID
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# Export the Internet Gateway
output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway.id
}

# Export the Public Subnet AZ-1 ID
output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}

# Export the Public Subnet AZ-2 ID
output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet_az2.id
}

# Export the Private App Subnet AZ-1 ID
output "private_app_subnet_az1_id" {
  value = aws_subnet.private_app_subnet_az1.id
}

# Export the Private App Subnet AZ-2 ID
output "private_app_subnet_az2_id" {
  value = aws_subnet.private_app_subnet_az2.id
}

# Export the First Availability Zone
output "availability_zone_1" {
  value = data.aws_availability_zones.available_zones.names[0]
}

# Export the Second Availability Zone
output "availability_zone_2" {
  value = data.aws_availability_zones.available_zones.names[1]
}
