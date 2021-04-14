variable "business_name" {
  description = "Business Name"
}

variable "cluster" {
  description = "Cluster Name"
}

variable "created_by" {
  description = "Created By"
}

variable "deregistration_delay" {
  description = "The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. The default value is 300 seconds."
  default     = 300
}

variable "enabled" {
  description = "Create resources"
  default     = true
  type        = bool
}

variable "environment" {
  description = "Environment"
}

variable "health_check_enabled" {
  description = "Indicates whether health checks are enabled. Defaults to true."
  default     = true
}

variable "health_check_healthy_thresold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy. Defaults to 3."
  default     = 3
}

variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. Default 30 seconds."
  default     = 30
}

variable "health_check_matcher" {
  description = "The HTTP codes to use when checking for a successful response from a target. You can specify multiple values (for example, '200,202') or a range of values (for example, '200-299')"
}

variable "health_check_path" {
  description = "The destination for the health check request"
}

variable "health_check_port" {
  description = "The port to use to connect with the target. Valid values are either ports 1-65536, or traffic-port. Defaults to traffic-port"
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = "The protocol to use to connect with the target. Defaults to HTTP"
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check. For Application Load Balancers, the range is 2 to 60 seconds and the default is 5 seconds. default is 10 seconds for TCP and HTTPS health checks and 6 seconds for HTTP health checks"
  default     = 6
}

variable "health_check_unhealthy_thresold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy . For Network Load Balancers, this value must be the same as the healthy_threshold. Defaults to 3."
  default     = 3
}

variable "port" {
  description = "The port on which targets receive traffic, unless overridden when registering a specific target"
}

variable "service_name" {
  description = "Service Name"
}

variable "subservice_name" {
  description = "Service Name"
}

variable "slow_start" {
  description = "The amount time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable. The default value is 0 seconds."
  default     = 0
}

variable "stickiness_cookie_duration" {
  description = "The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds)."
  default     = 86400
}

variable "stickiness_enabled" {
  description = "Boolean to enable / disable stickiness. Default is true"
  default     = true
}

variable "vpc_id" {
  description = "VPC ID"
}

