variable "asg_name_with_expression" {
  type        = list(map(string))
  description = "List of Map string containing Auto scaling group name for which you want to setup the instance refresh"
}

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
