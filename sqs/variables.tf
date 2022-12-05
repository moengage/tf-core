variable "created_by" {
  description = "Owner"
}

variable "cluster" {
  default     = "default"
  description = "Cluster identifier"
}

variable "environment" {
  description = "Environment name"
}

variable "business_name" {
  description = "Business Name"
}

variable "service_name" {
  description = "Service Name"
}

variable "subservice_name" {
  description = "Sub Service Name"
}

variable "enabled" {
  description = "Create SQS resource"
  default     = true
  type        = bool
}

variable "sqs_name" {
  description = "SQS Name"
}

variable "sqs_delay_seconds" {
  description = "SQS delay seconds"
  default = 0
}

variable "sqs_max_message_size" {
  description = "SQS Max Message Size"
  default = 262144
}

variable "sqs_message_retention_seconds" {
  description = "SQS Message Retention Seconds"
  default = 345600
}

variable "sqs_receive_wait_time_seconds" {
  description = "SQS Receive Wait Time seconds"
  default = 0
}

variable "sqs_visibility_timeout_seconds" {
  description = "SQS Visibility Timeout seconds"
  default = 1800
}

variable "sqs_alarm_actions" {
  type        = list(any)
  description = "The Alarm actions arn in list"
}

variable "sqs_ok_actions" {
  type        = list(any)
  default     = []
  description = "The OK actions arn in list"
}

variable "sqs_alarm_msgs_threshold" {
  type        = number
  default     = 100
  description = "The threshold for approximate number of messages for the queue"
}

variable "sqs_alarm_evaluation_periods" {
  type        = number
  default     = 5
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "sqs_alarm_datapoints_to_alarm" {
  type        = number
  default     = 5
  description = "The number of datapoints to check before alarming"
}

variable "sqs_alarm_metric_period" {
  type        = number
  default     = 60
  description = "The period in seconds over which the specified statistic is applied"
}

variable "create_sqs_default_alarms" {
  description = "Create SQS alarm"
  default     = true
  type        = bool
}