# Export EC2 AMI
output "ec2-linux-ami" {
  value = data.aws_ami.amazon_linux_2.id
}

# Ecport EC2 Instance in AZ-1 ID
output "ec2_az1_id" {
  value = aws_instance.ec2_instance_az1.id
}

# Export EC2 Instance in AZ-2 ID
output "ec2_az2_id" {
  value = aws_instance.ec2_instance_az2.id
}

# Ecport Private EC2 Instance in AZ-1 ID
output "private_ec2_az1_id" {
  value = aws_instance.ec2_instance_pr_az1.id
}

# Export Private EC2 Instance in AZ-2 ID
output "private_ec2_az2_id" {
  value = aws_instance.ec2_instance_pr_az2.id
}
