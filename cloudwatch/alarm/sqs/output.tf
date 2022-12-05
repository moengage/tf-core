output "alarm_arns" {
  value       = join(", ", aws_cloudwatch_metric_alarm.sqs_msgs_alarm.*.arn)
  description = "SQS Alarm ARNs"
}
