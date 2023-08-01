output "asg_notifications_topic_arn" {
  value = join(",", aws_sns_topic.default.*.arn)
}

output "id" {
  value = join(",", aws_autoscaling_group.default.*.id)
}

output "name" {
  value = join(",", aws_autoscaling_group.default.*.name)
}

output "autoscaling_policy_scaledown_arns" {
  value = values(aws_autoscaling_policy.scale_down)[*].arn
}

output "autoscaling_policy_scaleup_arns" {
  value = values(aws_autoscaling_policy.scale_up)[*].arn
}

output "alarm_arns" {
  value = { for k, v in aws_cloudwatch_metric_alarm.all_alarms : k => v.arn }
}