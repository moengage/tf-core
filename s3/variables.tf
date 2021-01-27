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

variable "unique_prefix" {
  description = "Unique prefix which will be appended to S3 bucket name and dynamodb table name"
  default     = "moe"
}

variable "region" {
  description = "AWS Region"
}

variable "team_name" {
  description = "Team Name"
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
