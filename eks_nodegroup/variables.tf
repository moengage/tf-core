variable "region" {
}

variable "associate_public_ip_address" {
}

variable "business_name" {
}

variable "created_by" {
}

variable "cluster_autoscaler_enabled" {
  default = true
  type    = bool
}

variable "default_cooldown" {
}

variable "health_check_type" {
}

variable "desired_capacity" {
}

variable "environment" {
}

variable "image_id" {
  default = ""
  type    = string
}

variable "instance_types" {
  description = "List of instance types, ordered priority, less index more priority"
  type        = list(string)
}

variable "instance_subnet_ids" {
  type = list(string)
}

variable "key_name" {
}

variable "max_size" {
}

variable "min_size" {
}

variable "on_demand_percentage_above_base_capacity" {
}

variable "service_name" {
}

variable "volume_size" {
}

variable "vpc_id" {
}

variable "cluster_name" {
}

variable "cluster_version" {
}

variable "bootstrap_extra_args" {
  default = ""
}
