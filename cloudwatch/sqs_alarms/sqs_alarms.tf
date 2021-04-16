resource "aws_cloudwatch_metric_alarm" "reports-sqs-msgs-alarm" {
  alarm_name                = format("%s-ApproximateNumberOfMessagesVisible", var.dimensions_QueueName)
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  threshold                 = var.sqs_msgs_threshold
  alarm_description         = "This metric monitors sqs approx number of messages visible"
  alarm_actions             = var.alarm_actions
  datapoints_to_alarm       = 1
  metric_name               = "ApproximateNumberOfMessagesVisible"
  namespace                 = "AWS/SQS"
  period                    = "300"
  statistic                 = "Sum"
  dimensions = {
    QueueName            = var.dimensions_QueueName
  }
}