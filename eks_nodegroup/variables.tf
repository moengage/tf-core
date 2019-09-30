variable "region" {
}

variable "associate_public_ip_address" {
}

variable "business_name" {
}

variable "created_by" {
}

variable "default_cooldown" {
}

variable "health_check_type" {
}

variable "desired_capacity" {
}

variable "environment" {
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

variable "primary_instance_type" {
}

variable "secondary_instance_type" {
}

variable "tertiary_instance_type" {
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
