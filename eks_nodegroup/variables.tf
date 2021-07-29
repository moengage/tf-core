variable "region" {
  description = "Region Name"
}

variable "associate_public_ip_address" {
  description = "Whether to associate public ip address to instances"
}

variable "architecture" {
  default     = "amd64"
  description = "Architecture, supported types are amd64, arm64, amd64-accelerated"
  validation {
    condition     = can(regex("^arm64$|^amd64$|^amd64-accelerated$", var.architecture))
    error_message = "Supported values are amd64, arm64, amd64-accelerated."
  }
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

variable "extra_asg_tags" {
  type    = list(object({ key = string, propagate_at_launch = bool, value = string }))
  default = []
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

variable "instance_group" {
  description = "Logical group name of instances"
  type        = string
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
  type = number
}

variable "service_name" {
}

variable "subservice_name" {
}

variable "volume_size" {
  default = "20"
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

variable "kubernetes_namespace" {
  default = "default"
}

variable "ecr_cross_account_registry_ids" {
  description = "List of AWS ECR registry ids/account ids"
  type        = list(string)
  default     = []
}

variable "target_group_arns" {
  type    = list(string)
  default = []
}

variable "spot_allocation_strategy" {
  default = "lowest-price"
}

variable "spot_instance_pools" {
  default = 3
}

variable "fab_tag" {
  default = "kubernetes"
}


variable "volume_type" {
  default = "gp3"
}

variable "device_name" {
  default = "/dev/xvda"
}

variable "enable_custom_dns" {
  default     = true
  description = "Enable custom DNS name server flag to override custom dns ip"
}

variable "custom_dns_ip" {
  description = "If enable_custom_dns_ip set to true use this ip"
  default     = "169.254.20.10"
}
