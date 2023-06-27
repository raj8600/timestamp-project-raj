# Export Lambda ARN
output "alb_lambda_arn" {
  value = aws_lb.application_load_balancer.arn
}

# Export ALB Target Group ARN
output "alb_target_group_arn" {
  value = aws_lb_target_group.alb_target_group.arn
}

# Export ALB DNS Name
output "alb_dns_name" {
  value = aws_lb.application_load_balancer.dns_name
}

# Export ALB Zone
output "alb_zone_id" {
  value = aws_lb.application_load_balancer.zone_id
}
