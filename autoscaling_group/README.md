## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| business\_name | Business Name | `any` | n/a | yes |
| cluster | Cluster Name | `string` | `"default"` | no |
| create\_asg\_security\_group | True to create asg sg | `bool` | `false` | no |
| created\_by | Created By | `any` | n/a | yes |
| default\_cooldown | Time between a scaling activity and the succeeding scaling activity | `any` | n/a | yes |
| desired\_capacity | The number of Amazon EC2 instances that should be running in the group | `any` | n/a | yes |
| enabled | Create resources | `bool` | `true` | no |
| enabled\_metrics | n/a | `list(string)` | <pre>[<br>  "GroupMinSize",<br>  "GroupMaxSize",<br>  "GroupDesiredCapacity",<br>  "GroupInServiceInstances",<br>  "GroupPendingInstances",<br>  "GroupStandbyInstances",<br>  "GroupTerminatingInstances",<br>  "GroupTotalInstances"<br>]</pre> | no |
| environment | Environment | `any` | n/a | yes |
| extra\_asg\_tags | n/a | `list(object({ key = string, propagate_at_launch = bool, value = string }))` | `[]` | no |
| fab\_tag | Fab Tag | `any` | n/a | yes |
| force\_delete | Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. You can force an autoscaling group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling. | `bool` | `false` | no |
| health\_check\_grace\_period | Time (in seconds) after instance comes into service before checking health. Default: 300 | `number` | `30` | no |
| health\_check\_type | EC2 or ELB. Controls how health checking is done. | `any` | n/a | yes |
| instance\_subnet\_ids | Subnet IDs where instances will be launched | `list(string)` | n/a | yes |
| instance\_types | List of instance types, ordered priority, less index more priority | `list(string)` | n/a | yes |
| launch\_template\_id | Template ID | `any` | n/a | yes |
| launch\_template\_version | Template version. Can be version number, $Latest, or $Default. | `string` | `"$Latest"` | no |
| max\_size | The maximum size of the auto scale group | `any` | n/a | yes |
| metrics\_granularity | The granularity to associate with the metrics to collect. The only valid value is 1Minute | `string` | `"1Minute"` | no |
| min\_elb\_capacity | Setting this causes Terraform to wait for this number of instances from this autoscaling group to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes. | `number` | `0` | no |
| min\_size | The minimum size of the auto scale group | `any` | n/a | yes |
| notification\_enabled | If enabled SNS notification will be sent out | `bool` | `false` | no |
| on\_demand\_allocation\_strategy | Strategy to use when launching on-demand instances. Valid values: prioritized. Default: prioritized | `string` | `"prioritized"` | no |
| on\_demand\_base\_capacity | Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances. Default: 0 | `number` | `0` | no |
| on\_demand\_percentage\_above\_base\_capacity | Percentage split between on-demand and Spot instances above the base on-demand capacity. Default: 100 | `number` | `100` | no |
| propagate\_tags\_at\_launch | Enables propagation of the tag to Amazon EC2 instances launched via this ASG | `bool` | `true` | no |
| protect\_from\_scale\_in | Allows setting instance protection. The autoscaling group will not select instances with this setting for terminination during scale in events. | `bool` | `false` | no |
| service\_name | Service name | `any` | n/a | yes |
| service\_type | Service type | `string` | `""` | no |
| spot\_allocation\_strategy | How to allocate capacity across the Spot pools. Valid values: lowest-price. Default: lowest-price | `string` | `"lowest-price"` | no |
| spot\_instance\_pools | Number of Spot pools per availability zone to allocate capacity. EC2 Auto Scaling selects the cheapest Spot pools and evenly allocates Spot capacity across the number of Spot pools that you specify. Default: 1 | `number` | `3` | no |
| spot\_max\_price | Maximum price per unit hour that the user is willing to pay for the Spot instances. Default: on-demand price | `string` | `""` | no |
| subservice\_name | Sub Service name | `string` | `""` | no |
| suspended\_processes | A list of processes to suspend for the AutoScaling Group. The allowed values are Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer. Note that if you suspend either the Launch or Terminate process types, it can prevent your autoscaling group from functioning properly | `list` | `[]` | no |
| target\_group\_arns | A list of aws\_alb\_target\_group ARNs, for use with Application Load Balancing. | `list(string)` | `[]` | no |
| termination\_policies | A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, OldestLaunchTemplate, AllocationStrategy, Default | `list(string)` | <pre>[<br>  "OldestInstance"<br>]</pre> | no |
| vpc\_id | VPC ID | `any` | n/a | yes |
| wait\_for\_capacity\_timeout | A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. Setting this to 0 causes Terraform to skip all Capacity Waiting behavior. Default: 10m | `string` | `"10m"` | no |
| wait\_for\_elb\_capacity | Setting this will cause Terraform to wait for exactly this number of healthy instances from this autoscaling group in all attached load balancers on both create and update operations. (Takes precedence over min\_elb\_capacity behavior.) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| asg\_notifications\_topic\_arn | n/a |
| id | n/a |

