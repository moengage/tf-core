resource "aws_sqs_queue" "default" {
  count                     = var.enabled ? 1 : 0
  name                      = var.sqs_name
  delay_seconds             = var.sqs_delay_seconds
  max_message_size          = var.sqs_max_message_size
  message_retention_seconds = var.sqs_message_retention_seconds
  receive_wait_time_seconds = var.sqs_receive_wait_time_seconds
  visibility_timeout_seconds= var.sqs_visibility_timeout_seconds
  sqs_managed_sse_enabled   = true

  tags = merge(
    local.default_tags,
    {
      "Name" = var.sqs_name
    },
  )
}

module "sqs_default_alarm" {
  source                  = "git@github.com:moengage/tf-core.git//cloudwatch/alarm/sqs?ref=master"

  count                   = var.create_sqs_default_alarms ? 1 : 0
  dimensions_queuename    = var.sqs_name
  evaluation_periods      = var.sqs_alarm_evaluation_periods
  sqs_msgs_threshold      = var.sqs_alarm_msgs_threshold
  alarm_actions           = var.sqs_alarm_actions
  ok_actions              = var.sqs_ok_actions
  datapoints_to_alarm     = var.sqs_alarm_datapoints_to_alarm
  metric_period           = var.sqs_alarm_metric_period
}

