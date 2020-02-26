output "asg_notifications_topic_arn" {
  value = join(",", aws_sns_topic.default.*.arn)
}

output "id" {
  value = join(",", aws_autoscaling_group.default.*.id)
}

