variable "environment" {
  description = "Environment name"
}

variable "region" {
  description = "Region name"
}

variable "created_by" {
  description = "email id of provisioner"
}

variable "cluster" {
  default     = "default"
  description = "cluster name"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
}

variable "enable_flow_logs" {
  default     = false
  description = "Whether to enable vpc flow logs"
}

variable "flow_logs_retention_in_days" {
  default     = 7
  description = "VPC flow logs retention time in S3 in days"
}

variable "availability_zones" {
  type        = "list"
  description = "availability zones list in which management subnets and respective infrastructure will be created"
}

variable "management_public_subnets" {
  type        = "map"
  description = "public subnets where nat gateways will be launched"
}
