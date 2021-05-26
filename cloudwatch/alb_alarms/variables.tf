variable "alb_name" {
  type        = string
  description = "The readable load balancer name. Specify only the load balancer name, no /app/ prefix or numerical suffix. Example, app3-dashboard"
}
variable "alarm_actions" {
  type        = list(any)
  description = "AWS SNS topic or AutoScaling policy ARN or any other supported action's ARNs in List"
}
variable "dimensions_loadbalancer" {
  type        = string
  description = "Filters the metric data by load balancer. Specify the load balancer as follows: app/load-balancer-name/1234567890123456"
}
variable "error_rate_threshold" {
  type        = number
  default     = 0.5
  description = "The threshold for Error rate in percentage"
}

variable "evaluation_periods" {
  type        = number
  default     = 2
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "metric_period" {
  type        = number
  default     = 300
  description = "The period in seconds over which the specified statistic is applied"
}
