output "sqs_arns" {
  value       = join(", ", aws_sqs_queue.default.*.arn)
  description = "SQS ARNs"
}


output "sqs_alarm_arns" {
  value       = join(", ", module.sqs_default_alarm.*.alarm_arns) 
  description = "SQS Alarm ARNs"
}

