variable "associate_public_ip_address" {
  description = "Associate a public ip address with the network interface. Boolean value."
}

variable "business_name" {
  description = "Business Name"
}

variable "created_by" {
  description = "Created By"
}

variable "cluster" {
  description = "Cluster Name"
  default     = "default"
}

variable "cpu_credits" {
  description = "The credit option for CPU usage. Can be standard or unlimited. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default"
  default     = "unlimited"
}

variable "default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity"
}

variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
}

variable "device_name" {
  description = "The name of the device to mount"
  default     = "/dev/sda1"
}

variable "delete_network_interfaces_on_termination" {
  description = "Whether the network interface should be destroyed on instance termination"
  default     = true
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = true
}

variable "extra_instance_tags" {
  type        = map(string)
  description = "Extra tags for instances to be launched in ASG"
  default     = {}
}

variable "extra_volume_tags" {
  type        = map(string)
  description = "Extra tags for volumes to be launched in ASGG"
  default     = {}
}

variable "instance_types" {
  type        = list(string)
  description = "List of instance type, ordered priority, less index more priority"
}

variable "notification_enabled" {
  description = "If enabled SNS notification will be sent out"
  default     = false
}

variable "enabled_metrics" {
  type = list(string)

  default = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

variable "environment" {
  description = "Environment"
}

variable "extra_asg_tags" {
  type    = list(object({ key = string, propagate_at_launch = bool, value = string }))
  default = []
}

variable "fab_tag" {
  description = "Fab Tag"
  default     = "nottagged"
}

variable "force_delete" {
  description = "Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. You can force an autoscaling group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling."
  default     = false
}

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health. Default: 300"
  default     = 30
}

variable "health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done."
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with"
  default     = ""
}

variable "image_id" {
  description = "AMI ID to use"
}

variable "instance_subnet_ids" {
  description = "Subnet IDs where instances will be launched"
  type        = list(string)
}

variable "instance_security_group_ids" {
  description = "Security Group IDs which will be attached to launched instances"
  type        = list(string)
}

variable "key_name" {
  description = "Key Pair to use when launching instances"
}

variable "launch_template_version" {
  description = "Template version. Can be version number, $Latest, or $Default."
  default     = "$Latest"
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
}

variable "metrics_granularity" {
  description = "The granularity to associate with the metrics to collect. The only valid value is 1Minute"
  default     = "1Minute"
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
}

variable "min_elb_capacity" {
  description = "Setting this causes Terraform to wait for this number of instances from this autoscaling group to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes."
  default     = 0
}

variable "monitoring_enabled" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "on_demand_allocation_strategy" {
  description = "Strategy to use when launching on-demand instances. Valid values: prioritized. Default: prioritized"
  default     = "prioritized"
}

variable "on_demand_base_capacity" {
  description = "Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances. Default: 0"
  default     = 0
}

variable "on_demand_percentage_above_base_capacity" {
  description = "Percentage split between on-demand and Spot instances above the base on-demand capacity. Default: 100"
  default     = 100
}

variable "protect_from_scale_in" {
  description = "Allows setting instance protection. The autoscaling group will not select instances with this setting for terminination during scale in events."
  default     = false
}

variable "service_name" {
  description = "Service name"
}

variable "spot_allocation_strategy" {
  description = "How to allocate capacity across the Spot pools. Valid values: lowest-price. Default: lowest-price"
  default     = "lowest-price"
}

variable "spot_instance_pools" {
  description = "Number of Spot pools per availability zone to allocate capacity. EC2 Auto Scaling selects the cheapest Spot pools and evenly allocates Spot capacity across the number of Spot pools that you specify. Default: 1"
  default     = 3
}

variable "spot_max_price" {
  description = "Maximum price per unit hour that the user is willing to pay for the Spot instances. Default: on-demand price"
  default     = ""
}

variable "suspended_processes" {
  description = "A list of processes to suspend for the AutoScaling Group. The allowed values are Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer. Note that if you suspend either the Launch or Terminate process types, it can prevent your autoscaling group from functioning properly"
  default     = []
}

variable "target_group_arns" {
  description = "A list of aws_alb_target_group ARNs, for use with Application Load Balancing."
  type        = list(string)
  default     = []
}

variable "termination_policies" {
  type        = list(string)
  description = "A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, OldestLaunchTemplate, AllocationStrategy, Default"
  default     = ["OldestInstance"]
}

variable "user_data" {
  description = "Instance user data"
  default     = ""
}

variable "volume_size" {
  description = "The size of the volume in gigabytes"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "wait_for_capacity_timeout" {
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. Setting this to 0 causes Terraform to skip all Capacity Waiting behavior. Default: 10m"
  default     = "10m"
}

variable "wait_for_elb_capacity" {
  description = "Setting this will cause Terraform to wait for exactly this number of healthy instances from this autoscaling group in all attached load balancers on both create and update operations. (Takes precedence over min_elb_capacity behavior.)"
  default     = 0
}

