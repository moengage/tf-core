output "arn" {
  value = aws_lb_target_group.default[0].arn
}

output "arn_suffix" {
  value = aws_lb_target_group.default[0].arn_suffix
}

output "name" {
  value = aws_lb_target_group.default[0].name
}

