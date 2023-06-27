# Allocate Elastic IP. It will be used for the Nat-Gateway in the Public Subnet AZ-1
resource "aws_eip" "eip_for_nat_gateway_az1" {
  vpc = true

  tags = {
    Name = "${var.project_name}-${var.environment}-eip-az1"
  }
}

# EIP for Nat-Gateway in the Public Subnet AZ-2
resource "aws_eip" "eip_for_nat_gateway_az2" {
  vpc = true

  tags = {
    Name = "${var.project_name}-${var.environment}-eip-az2"
  }
}

# Create Nat Gateway in Public Subnet AZ-1
resource "aws_nat_gateway" "nat_gateway_az1" {
  connectivity_type = "public"
  allocation_id = aws_eip.eip_for_nat_gateway_az1.id
  subnet_id     = var.public_subnet_az1_id

  tags = {
    Name = "${var.project_name}-${var.environment}-ng-az1"
  }

  depends_on = [var.internet_gateway]
}

# Create Nat Gateway in Public Subnet AZ-2
resource "aws_nat_gateway" "nat_gateway_az2" {
  connectivity_type = "public"
  allocation_id = aws_eip.eip_for_nat_gateway_az2.id
  subnet_id     = var.public_subnet_az2_id

  tags = {
    Name = "${var.project_name}-${var.environment}-ng-az2"
  }

  depends_on = [var.internet_gateway]
}

# Create Private Route Table in AZ-1 and add route through Nat Gateway AZ-1
resource "aws_route_table" "private_route_table_az1" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-az1"
  }
}

# Associate Private App Subnet AZ-1 with Private Route Table AZ-1
resource "aws_route_table_association" "private_app_subnet_az1_rt_az1_association" {
  subnet_id      = var.private_app_subnet_az1_id
  route_table_id = aws_route_table.private_route_table_az1.id
}

# Associate Private App Subnet AZ-1 with Private Route Table AZ-1
resource "aws_route_table_association" "private_app_subnet_az2_rt_az2_association" {
  subnet_id      = var.private_app_subnet_az2_id
  route_table_id = aws_route_table.private_route_table_az1.id
}

# Create Private Route Table in AZ-2 and add route through Nat Gateway AZ-2
resource "aws_route_table" "private_route_table_az2" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az2.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-az2"
  }
}
