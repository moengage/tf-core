variable "alarm_actions" {
  type        = list(any)
  description = "The Alarm actions arn in list"

}
variable "dimensions_queuename" {
  type        = string
  description = "the SQS Queue name"
}
variable "sqs_msgs_threshold" {
  type        = number
  description = "The threshold for approximate number of messages for the queue"
}
variable "evaluation_periods" {
  type        = number
  default     = 2
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "datapoints_to_alarm" {
  type        = number
  default     = 2
  description = "The number of datapoints to check before alarming"
}


variable "metric_period" {
  type        = number
  default     = 300
  description = "The period in seconds over which the specified statistic is applied"
}
