variable "environment" {
  description = "Environment name"
}

variable "region" {
  description = "Region name"
}

variable "created_by" {
  description = "ID of provisioner"
}

variable "cluster" {
  default     = "default"
  description = "Cluster name"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "business_name" {
  description = "Business/Team Name"
}

variable "availability_zones" {
  type        = "list"
  description = "Availability zones list in which management subnets and respective infrastructure will be created"
}

variable "nat_gateways" {
  type        = "map"
  description = "availability_zones and nat_gateway_ids map"
}
