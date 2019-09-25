variable "created_by" {
  description = "ID of provisioner"
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
}

variable "region" {
  description = "AWS Region"
}

