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
  type        = string
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

variable "scale_up_adjustment_type" {
  type        = string
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are `ChangeInCapacity`, `ExactCapacity` and `PercentChangeInCapacity`"
}

variable "scale_up_policy_type" {
  type        = string
  description = "The scaling policy type required for the usecase"
}

variable "scale_down_scaling_adjustment" {
  type        = number
  description = "The number of instances by which to scale. `scale_down_scaling_adjustment` determines the interpretation of this number. A positive increment adds to the current capacity and a negative value removes from the current capacity"
}

variable "scale_down_adjustment_type" {
  type        = string
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are `ChangeInCapacity`, `ExactCapacity` and `PercentChangeInCapacity`"
}

variable "scale_down_policy_type" {
  type        = string
  description = "The scaling policy type. Currently only `SimpleScaling` is supported"
}

variable "scale_down_cooldown_seconds" {
  type        = number
  default     = 300
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start"
}

variable "custom_alarms" {
  type = map(object({
    alarm_name                = string
    comparison_operator       = string
    evaluation_periods        = number
    metric_name               = string
    namespace                 = string
    period                    = number
    statistic                 = string
    threshold                 = number
    treat_missing_data        = string
    ok_actions                = list(string)
    insufficient_data_actions = list(string)
    dimensions_name           = string
    dimensions_target         = string
    alarm_description         = string
    alarm_actions             = list(string)
  }))
  default     = {}
  description = "Map of custom CloudWatch alarms configurations"
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

variable "period" {
  description = "The period in seconds over which the specified statistic is applied"
  type        = number
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric, supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
  default     = "Average"
}

variable "high_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  type        = number
}

variable "low_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  type        = number
}

variable "high_threshold" {
  description = "The value against which the specified statistic is compared"
  type        = number
}

variable "low_threshold" {
  description = "The value against which the specified statistic is compared"
  type        = number
}

variable "dimensions_target" {
  description = "Autoscaling Group target OR SQS Queue Name"
  type        = string
}

variable "estimated_instance_warmup" {
  description = "The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics. Without a value, AWS will default to the group's specified cooldown period."
  type        = string
}

variable "comparison_operator_high" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. Supported LessThanOrEqualToThreshold , GreaterThanOrEqualToThreshold"
  type        = string
}

variable "comparison_operator_low" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. Supported LessThanOrEqualToThreshold , GreaterThanOrEqualToThreshold"
  type        = string
}

variable "metric_name" {
  description = "The name for the alarm's associated metric. Supported CPUUtilization , ApproximateNumberOfMessagesVisible"
  type        = string
}

variable "namespace" {
  description = "The namespace of the metric, supported AWS/EC2 , AWS/SQS "
  type        = string
}

variable "dimensions_name" {
  description = "AutoScalingGroupName or QueueName"
  type        = string
}

variable "treat_missing_data" {
  description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. Defaults to missing."
  type        = string
}

variable "estimated_instance_warmup" {
  description = "The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics"
  type        = number
}

variable "predefined_metric_type" {
  description = "The metric type for track tracking policy "
  type        = string
}

variable "target_value" {
  description = "The target value for the metric for target tracking policy"
  type        = any
}

variable "disable_scale_in" {
  description = "Indicates whether scale in by the target tracking policy is disabled"
  type        = bool
}