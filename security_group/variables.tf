variable "environment" {
  description = "Environment"
}

variable "business_name" {
  description = "business_name tag"
}

variable "service_name" {
  description = "service_name"
}

variable "subservice_name" {
  description = "subservice_name"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "sg_description" {
  description = "The security group description"
}

variable "allow_all_egress" {
  type        = bool
  default     = true
  description = "Add an allow all egress rule to the SG"
}

variable "ingress_rules" {
  description = "List of ingress rules to create."
  type        = any
  default     = []
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for the security groups"
  type        = map
  default     = {}
}
