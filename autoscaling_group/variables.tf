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

variable "default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity"
}

variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
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

variable "instance_subnet_ids" {
  description = "Subnet IDs where instances will be launched"
  type        = list(string)
}

variable "instance_types" {
  description = "List of instance types, ordered priority, less index more priority"
  type        = list(string)
}

variable "launch_template_id" {
  description = "Template ID"
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

variable "service_type" {
  description = "Service type"
  default     = ""
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

variable "propagate_tags_at_launch" {
  description = "Enables propagation of the tag to Amazon EC2 instances launched via this ASG"
  default = true
}
