resource "aws_cloudwatch_metric_alarm" "sqs_msgs_alarm" {
  alarm_name          = format("%s-ApproximateNumberOfMessagesVisible", var.dimensions_queuename)
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  threshold           = var.sqs_msgs_threshold
  alarm_description   = "This metric monitors sqs approx number of messages visible"
  alarm_actions       = var.alarm_actions
  datapoints_to_alarm = var.datapoints_to_alarm
  metric_name         = "ApproximateNumberOfMessagesVisible"
  namespace           = "AWS/SQS"
  period              = var.metric_period
  statistic           = "Sum"
  dimensions = {
    QueueName = var.dimensions_queuename
  }
}
