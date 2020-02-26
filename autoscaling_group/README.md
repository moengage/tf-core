## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| business\_name | Business Name | string | n/a | yes |
| created\_by | Created By | string | n/a | yes |
| default\_cooldown | Time between a scaling activity and the succeeding scaling activity | string | n/a | yes |
| enabled | Create resources | bool | true | no |
| desired\_capacity | The number of Amazon EC2 instances that should be running in the group | string | n/a | yes |
| environment | Environment | string | n/a | yes |
| fab\_tag | Fab Tag | string | n/a | yes |
| health\_check\_type | EC2 or ELB. Controls how health checking is done. | string | n/a | yes |
| instance\_subnet\_ids | Subnet IDs where instances will be launched | list | n/a | yes |
| launch\_template\_id | Template ID | string | n/a | yes |
| max\_size | The maximum size of the auto scale group | string | n/a | yes |
| min\_size | The minimum size of the auto scale group | string | n/a | yes |
| primary\_instance\_type | Primary instance Type | string | n/a | yes |
| secondary\_instance\_type | Secondary instance Type | string | n/a | yes |
| service\_name | Service name | string | n/a | yes |
| tertiary\_instance\_type | Tertiary instance type | string | n/a | yes |
| vpc\_id | VPC ID | string | n/a | yes |
| cluster | Cluster Name | string | `"default"` | no |
| enabled\_metrics |  | list | `<list>` | no |
| force\_delete | Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. You can force an autoscaling group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling. | string | `"false"` | no |
| health\_check\_grace\_period | Time (in seconds) after instance comes into service before checking health. Default: 300 | string | `"30"` | no |
| launch\_template\_version | Template version. Can be version number, $Latest, or $Default. | string | `"$Latest"` | no |
| metrics\_granularity | The granularity to associate with the metrics to collect. The only valid value is 1Minute | string | `"1Minute"` | no |
| min\_elb\_capacity | Setting this causes Terraform to wait for this number of instances from this autoscaling group to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes. | string | `"0"` | no |
| notification\_enabled | If enabled SNS notification will be sent out | string | `"false"` | no |
| on\_demand\_allocation\_strategy | Strategy to use when launching on-demand instances. Valid values: prioritized. Default: prioritized | string | `"prioritized"` | no |
| on\_demand\_base\_capacity | Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances. Default: 0 | string | `"0"` | no |
| on\_demand\_percentage\_above\_base\_capacity | Percentage split between on-demand and Spot instances above the base on-demand capacity. Default: 100 | string | `"100"` | no |
| protect\_from\_scale\_in | Allows setting instance protection. The autoscaling group will not select instances with this setting for terminination during scale in events. | string | `"false"` | no |
| service\_type | Service type | string | `""` | no |
| spot\_allocation\_strategy | How to allocate capacity across the Spot pools. Valid values: lowest-price. Default: lowest-price | string | `"lowest-price"` | no |
| spot\_instance\_pools | Number of Spot pools per availability zone to allocate capacity. EC2 Auto Scaling selects the cheapest Spot pools and evenly allocates Spot capacity across the number of Spot pools that you specify. Default: 1 | string | `"3"` | no |
| spot\_max\_price | Maximum price per unit hour that the user is willing to pay for the Spot instances. Default: on-demand price | string | `""` | no |
| suspended\_processes | A list of processes to suspend for the AutoScaling Group. The allowed values are Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer. Note that if you suspend either the Launch or Terminate process types, it can prevent your autoscaling group from functioning properly | list | `<list>` | no |
| target\_group\_arns | A list of aws_alb_target_group ARNs, for use with Application Load Balancing. | list | `<list>` | no |
| termination\_policies | A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, OldestLaunchTemplate, AllocationStrategy, Default | list | `<list>` | no |
| wait\_for\_capacity\_timeout | A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. Setting this to 0 causes Terraform to skip all Capacity Waiting behavior. Default: 10m | string | `"10m"` | no |
| wait\_for\_elb\_capacity | Setting this will cause Terraform to wait for exactly this number of healthy instances from this autoscaling group in all attached load balancers on both create and update operations. (Takes precedence over min_elb_capacity behavior.) | string | `"0"` | no |
| propagate_tags_at_launch |Enables propagation of the tag to Amazon EC2 instances launched via this ASG | N/A | yes
| create_asg_security_group | True to create asg sg | false| no


## Outputs

| Name | Description |
|------|-------------|
| asg\_instance\_security\_group\_id |  |
| asg\_notifications\_topic\_arn |  |
| id |  |

