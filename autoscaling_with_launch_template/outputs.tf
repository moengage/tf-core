output "asg_instance_security_group_id" {
  value = "${join(",", aws_security_group.instances.*.id)}"
}

output "asg_notifications_topic_arn" {
  value = "${join(",", aws_sns_topic.default.*.arn)}"
}

output "id" {
  value = "${join(",", aws_autoscaling_group.default.*.id)}"
}
