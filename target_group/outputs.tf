output "arn" {
  value = join(", ", aws_lb_target_group.default.*.arn)
}

output "arn_suffix" {
  value = join(", ", aws_lb_target_group.default.*.arn_suffix)
}

output "name" {
  value = join(", ", aws_lb_target_group.default.*.name)
}
