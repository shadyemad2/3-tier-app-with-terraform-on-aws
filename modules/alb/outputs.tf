output "alb_dns_name" {
  value = aws_lb.shady_alb.dns_name
}

output "alb_target_group_arn" {
  value = aws_lb_target_group.alb_tg.arn
}

output "alb_arn" {
  value = aws_lb.shady_alb.arn
  
}
