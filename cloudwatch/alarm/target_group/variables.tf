variable "tg_name" {
  type        = string
  description = "The Target Group Name"
}

variable "alarm_actions" {
  type        = list(any)
  description = "The Alarm actions arn in list"
}

variable "dimensions_loadbalancer" {
  type        = string
  description = "Filters the metric data by load balancer. Specify the load balancer as follows: app/load-balancer-name/1234567890123456"
}

variable "dimensions_targetgroup" {
  type        = string
  description = "Filters the metric data by load balancer. Specify the load balancer as follows: app/load-balancer-name/1234567890123456"
}

variable "tg_error_rate_threshold" {
  type        = number
  default     = 0.5
  description = "The threshold for Error rate in percentage"
}

variable "healthy_hosts_threshold" {
  type        = number
  default     = 1
  description = "The threshold for Healthy Host Count per TG"
}

variable "tg_resp_time_threshold" {
  type        = number
  default     = 1
  description = "The threshold for TG response time"
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
