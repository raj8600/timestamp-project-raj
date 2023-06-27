# Use data source to get a registered Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# Launch the EC2 Instance in Public Subnet AZ-1
resource "aws_instance" "ec2_instance_az1" {
  ami                     = data.aws_ami.amazon_linux_2.id
  instance_type           = "t2.micro"
  key_name                = "sl_kp_lab"
  monitoring              = false
  vpc_security_group_ids  = [var.ec2_security_group_id]
  subnet_id               = var.public_subnet_az1_id
  user_data               = file("${path.cwd}/modules/ec2/user_data.sh")

  tags = {
    Name = "${var.project_name}-${var.environment}-ec2-az1"
  }
}

# Create EC2 Instance in Public Subnet AZ-2
resource "aws_instance" "ec2_instance_az2" {
  ami                     = data.aws_ami.amazon_linux_2.id
  instance_type           = "t2.micro"
  key_name                = "sl_kp_lab"
  monitoring              = false
  vpc_security_group_ids  = [var.ec2_security_group_id]
  subnet_id               = var.public_subnet_az2_id
  user_data               = file("${path.cwd}/modules/ec2/user_data.sh")

  tags = {
    Name = "${var.project_name}-${var.environment}-ec2-az2"
  }
}

# Launch the EC2 Instance in Private Subnet AZ-1
resource "aws_instance" "ec2_instance_pr_az1" {
  ami                     = data.aws_ami.amazon_linux_2.id
  instance_type           = "t2.micro"
  key_name                = "sl_kp_lab"
  monitoring              = false
  vpc_security_group_ids  = [var.ec2_security_group_id]
  subnet_id               = var.private_app_subnet_az1_id
  user_data               = file("${path.cwd}/modules/ec2/user_data.sh")

  tags = {
    Name = "${var.project_name}-${var.environment}-pr-ec2-az1"
  }
}

# Create EC2 Instance in Private Subnet AZ-2
resource "aws_instance" "ec2_instance_pr_az2" {
  ami                     = data.aws_ami.amazon_linux_2.id
  instance_type           = "t2.micro"
  key_name                = "sl_kp_lab"
  monitoring              = false
  vpc_security_group_ids  = [var.ec2_security_group_id]
  subnet_id               = var.private_app_subnet_az2_id
  user_data               = file("${path.cwd}/modules/ec2/user_data.sh")

  tags = {
    Name = "${var.project_name}-${var.environment}-pr-ec2-az2"
  }
}
