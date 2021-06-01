variable "create_cpu_based_asg_scaling_policy" {
  description = "True to create asg cpu based scaling policy"
  default     = false
  type        = bool
}

variable "create_alb_tg_rpm_based_asg_scaling_policy" {
  description = "True to create alb tg rpm based scaling policy"
  default     = false
  type        = bool
}

variable "create_sqs_msgs_alarm_based_asg_scale_in_policy" {
  description = "True to create sqs alarm based scale in policy"
  default     = false
  type        = bool
}

variable "create_sqs_msgs_alarm_based_asg_scale_out_policy" {
  description = "True to create sqs alarm based scale out policy"
  default     = false
  type        = bool
}

variable "asg_name" {
  type        = string
  description = "The ASG name for which we creating scaling policy"
}

variable "estimated_instance_warmup" {
  type        = number
  description = "estimated_instance_warmup time in seconds"
  default     = 300
}

variable "asg_avg_cpu_utilization_threshold" {
  type        = number
  description = "asg_avg_cpu_utilization_threshold for the scaling policy"
  default     = 50
}

variable "alb_tg_suffix" {
  type        = string
  description = "the ALB and TG suffix string concatenated. example \"app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff\""
}

variable "alb_tg_request_count_threshold" {
  type        = string
  description = "alb_tg_request_count_threshold for the scaling policy"
}

variable "scale_in_adjustment_count" {
  type        = number
  description = "scale_in_adjustment_count is the number of units the ASG to scale in"
  default     = 1
}

variable "scale_in_cooldown_seconds" {
  type        = number
  description = "scale_in cooldown time in seconds "
  default     = 300
}

variable "sqs_queue_name" {
  type        = string
  description = "sqs_queue_name for the alarm"
}

variable "sqs_msgs_low_alarm_evaluation_periods" {
  type        = number
  description = "how many times to evaluate the alarm condition within the period"
  default     = 5
}

variable "sqs_msgs_low_alarm_threshold" {
  type        = number
  description = "sqs_msgs_low alarm threshold"
}

variable "sqs_msgs_low_alarm_datapoints_to_alarm" {
  type        = number
  description = "sqs_msgs_low alarm number of datapoints match condition to_alarm"
  default     = 5
}

variable "sqs_msgs_low_alarm_periods" {
  type        = number
  description = "sqs_msgs_low alarm periods"
  default     = 60
}

variable "scale_out_adjustment_count" {
  type        = number
  description = "scale_out_adjustment_count is the number of units the ASG to scale in"
  default     = 1
}

variable "scale_out_cooldown_seconds" {
  type        = number
  description = "scale_in cooldown time in seconds "
  default     = 300
}

variable "sqs_msgs_high_alarm_evaluation_periods" {
  type        = number
  description = "how many times to evaluate the alarm condition with evaluation period"
  default     = 5
}

variable "sqs_msgs_high_alarm_threshold" {
  type        = number
  description = "sqs_msgs_low alarm threshold"
}

variable "sqs_msgs_high_alarm_datapoints_to_alarm" {
  type        = number
  description = "sqs_msgs_low alarm number of datapoints match condition to activate alarm"
  default     = 5
}

variable "sqs_msgs_high_alarm_periods" {
  type        = number
  description = "sqs_msgs_low alarm periods in seconds"
  default     = 60
}

