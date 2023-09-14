variable "business_name" {
  description = "Business Name"
}

variable "created_by" {
  description = "Created By"
}

variable "asg_name" {
  description = "name that need to be assigned for asg"
  type = string
  default = ""
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
  type        = string
}

variable "instance_subnet_ids" {
  description = "Subnet IDs where instances will be launched"
  type        = list(string)
}

variable "instance_types" {
  type    = map(list(string))
  default = {
    "AMD" = ["t3a.small","t3.small","t2.small"]
    "ARM"  = ["t4g.small", "t4g.medium"]
  }
}


variable "architecture_type" { 
  description = "Architecture type for instance selection" 
  type = string 
  default = "x86_64" 
}

variable "asg_with_abs" {
  description = "by default the abs configuration will be true for asg creation"
  default     = true
  type        = bool
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

variable "subservice_name" {
  description = "Sub Service name"
  default     = ""
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

variable "initial_lifecycle_hooks" {
  description = "One or more Lifecycle Hooks to attach to the Auto Scaling Group before instances are launched. The syntax is exactly the same as the sepa    rate `aws_autoscaling_lifecycle_hook` resource, without the `autoscaling_group_name` attribute. Please note that this will only work when creating a new A    uto Scaling Group. For all other use-cases, please use `aws_autoscaling_lifecycle_hook` resource"
  type        = list(map(string))
  default     = []
}

variable "capacity_rebalance" {
  type        = bool
  default     = false
  description = "Indicates whether capacity rebalance is enabled. Otherwise, capacity rebalance is disabled."
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
  default     = true
}

variable "enabled" {
  description = "Create resources"
  default     = true
  type        = bool
}

variable "create_asg_security_group" {
  description = "True to create asg sg"
  default     = false
  type        = bool
}

variable "sns_topic_alarms_arn" {
  type        = string
  description = "ARN of SNS topic that will be subscribed to an alarm."
  default     = ""
}

variable "scaling_policies" {
  description = "Map of target scaling policy schedule to create"
  type        = any
  default     = {}
}

variable "scaling_up_policies" {
  description = "Map of target scaling policy schedule to create"
  type        = any
  default     = {}
}

variable "scaling_down_policies" {
  description = "Map of target scaling policy schedule to create"
  type        = any
  default     = {}
}

variable "create_schedule" {
  description = "Determines whether to create autoscaling group schedule or not"
  type        = bool
  default     = false
}

variable "schedules" {
  description = "Map of autoscaling group schedule to create"
  type        = map(any)
  default     = {}
}

variable "step_adjustment" {
  description = "Map of target scaling policy schedule to create"
  type        = any
  default     = {}
}

variable "metric_aggregation_type" {
  type    = string
  default = "Average"
}

variable "high_period" {
  description = "The period in seconds over which the specified statistic is applied"
  type        = number
  default     = 120
}

variable "low_period" {
  description = "The period in seconds over which the specified statistic is applied"
  type        = number
  default     = 60
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric, supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
  default     = "Average"
}

variable "high_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  type        = number
  default     = 0
}

variable "low_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  type        = number
  default     = 0
}

variable "high_threshold" {
  description = "The value against which the specified statistic is compared"
  type        = number
  default     = 0
}

variable "low_threshold" {
  description = "The value against which the specified statistic is compared"
  type        = number
  default     = 0
}

variable "dimensions_target" {
  description = "Autoscaling Group target OR SQS Queue Name"
  type        = string
  default     = ""
}

variable "comparison_operator_high" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. Supported LessThanOrEqualToThreshold , GreaterThanOrEqualToThreshold"
  type        = string
  default     = "GreaterThanOrEqualToThreshold"
}

variable "comparison_operator_low" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. Supported LessThanOrEqualToThreshold , GreaterThanOrEqualToThreshold"
  type        = string
  default     = "LessThanOrEqualToThreshold"
}

variable "metric_name" {
  description = "The name for the alarm's associated metric. Supported CPUUtilization , ApproximateNumberOfMessagesVisible"
  type        = string
  default     = "ApproximateNumberOfMessagesVisible"
}

variable "namespace" {
  description = "The namespace of the metric, supported AWS/EC2 , AWS/SQS "
  type        = string
  default     = ""
}

variable "dimensions_name" {
  description = "AutoScalingGroupName or QueueName"
  type        = string
  default     = ""
}

variable "treat_missing_data" {
  description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. Defaults to missing."
  type        = string
  default     = "missing"
}

variable "estimated_instance_warmup" {
  description = "The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics"
  type        = number
  default     = 300
}

variable "predefined_metric_type" {
  description = "The metric type for track tracking policy "
  type        = string
  default     = ""
}

variable "target_value" {
  description = "The target value for the metric for target tracking policy"
  type        = any
  default     = 50.0
}

variable "disable_scale_in" {
  description = "Indicates whether scale in by the target tracking policy is disabled"
  type        = bool
  default     = false
}

variable "enable_target_tracking" {
  description = "Enable target Tracking Policy"
  default     = false
  type        = bool
}

variable "autoscaling_policies_enabled" {
  type        = bool
  default     = false
  description = "Whether to create `aws_autoscaling_policy` and `aws_cloudwatch_metric_alarm` resources to control Auto Scaling"
}

variable "arch_type" {
  type        = string
  default     = "AMD"
  description = "The Architecture type for the ASG Instances."
}