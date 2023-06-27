# Create Target Group
resource "aws_lb_target_group" "alb_target_group" {
  name        = "${var.project_name}-${var.environment}-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
}

# Attach EC2 Instance in AZ-1 to Target Group
resource "aws_lb_target_group_attachment" "ec2_az1" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.private_ec2_az1_id
  port             = 80
}

# Attach EC2 Instance in AZ-2 to target Group
resource "aws_lb_target_group_attachment" "ec2_az2" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.private_ec2_az2_id
  port             = 80
}

# Create Application Load Balancer
resource "aws_lb" "application_load_balancer" {
  name               = "${var.project_name}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = [var.public_subnet_az1_id, var.public_subnet_az2_id]

  enable_deletion_protection = false

  tags   = {
    Name = "${var.project_name}-${var.environment}-alb"
  }
}

# Create a listener on port 80 with redirect action
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.alb_target_group.id
    type             = "forward"
  }
}

# Listner Rule
#resource "aws_lb_listener_rule" "static" {
#  listener_arn  = aws_lb_listener.front_end.arn
#  priority     = 100
#
#  action {
#    type             = "forward"
#    target_group_arn = aws_lb_target_group.alb_target_group.arn
#  }
#
#  condition {
#    path_pattern {
#        values = ["/var/www/html/index2.html"]
#    }
#  }
#}
