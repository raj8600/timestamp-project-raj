# Export the EC2 Security Group ID
output "ec2_security_group_id" {
  value = aws_security_group.ec2_security_group.id
}

# Export the ALB Security Group ID
output "alb_security_group_id" {
  value = aws_security_group.alb_security_group.id
}
