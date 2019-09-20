resource "aws_sns_topic" "default" {
  count = var.notification_enabled ? 1 : 0
  name  = "${local.resource_identifier}-asg-notifications"
}

resource "aws_autoscaling_notification" "default" {
  count       = var.notification_enabled ? 1 : 0
  topic_arn   = aws_sns_topic.default[0].arn
  group_names = aws_autoscaling_group.default.*.id

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]
}

