variable "associate_public_ip_address" {
  description = "Associate a public ip address with the network interface. Boolean value."
}

variable "business_name" {
  description = "Business Name"
}

variable "cluster" {
  description = "Cluster Name"
}

variable "cpu_credits" {
  description = "The credit option for CPU usage. Can be standard or unlimited. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default"
  default     = "unlimited"
}

variable "created_by" {
  description = "Created By"
}

variable "delete_network_interfaces_on_termination" {
  description = "Whether the network interface should be destroyed on instance termination"
  default     = true
}

variable "device_name" {
  description = "The name of the device to mount"
  default     = "/dev/sda1"
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = true
}

variable "environment" {
  description = "Environment"
}

variable "fab_tag" {
  description = "Fab Tag"
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with"
  default     = ""
}

variable "image_id" {
  description = "AMI ID to use"
}

variable "instance_security_group_ids" {
  description = "Security Group IDs which will be attached to launched instances"
  type        = list(string)
}

variable "key_name" {
  description = "Key Pair to use when launching instances"
}

variable "monitoring_enabled" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
}

variable "service_name" {
  description = "Service name"
}

variable "subservice_name" {
  description = "Sub Service Name"
  default     = ""
}

variable "service_type" {
  description = "Service Type"
  default     = ""
}

variable "volume_size" {
  description = "The size of the volume in gigabytes"
}

variable "volume_type" {
  description = "Volume Type"
  default     = "gp2"
}

