variable "region" {
  description = "Region Name"
}

variable "associate_public_ip_address" {
  description = "Whether to associate public ip address to instances"
}

variable "business_name" {
  description = "business name tag"
}

variable "created_by" {
  description = "Creator"
}

variable "cluster_autoscaler_enabled" {
  default     = true
  description = "Add cluster autoscaler tags"
  type        = bool
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
  default     = ""
  type        = string
  description = "AMI to use, if not specified latest EKS Optimized AMI will be used"
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

variable "ecr_cross_account_registry_ids" {
  description = "List of AWS ECR registry ids/account ids"
  default     = []
}

variable "target_group_arns" {
  default = []
}
