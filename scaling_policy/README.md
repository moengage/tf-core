## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_policy.alb_tg_rpm_based_asg_scaling_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.cpu_based_asg_scaling_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.sqs_msgs_alarm_based_asg_scale_in_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.sqs_msgs_alarm_based_asg_scale_out_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_cloudwatch_metric_alarm.sqs_msgs_high_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.sqs_msgs_low_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_tg_request_count_threshold"></a> [alb\_tg\_request\_count\_threshold](#input\_alb\_tg\_request\_count\_threshold) | alb\_tg\_request\_count\_threshold for the scaling policy | `string` | n/a | yes |
| <a name="input_alb_tg_suffix"></a> [alb\_tg\_suffix](#input\_alb\_tg\_suffix) | the ALB and TG suffix string concatenated. example "app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff" | `string` | n/a | yes |
| <a name="input_asg_avg_cpu_utilization_threshold"></a> [asg\_avg\_cpu\_utilization\_threshold](#input\_asg\_avg\_cpu\_utilization\_threshold) | asg\_avg\_cpu\_utilization\_threshold for the scaling policy | `number` | `50` | no |
| <a name="input_asg_name"></a> [asg\_name](#input\_asg\_name) | The ASG name for which we creating scaling policy | `string` | n/a | yes |
| <a name="input_create_alb_tg_rpm_based_asg_scaling_policy"></a> [create\_alb\_tg\_rpm\_based\_asg\_scaling\_policy](#input\_create\_alb\_tg\_rpm\_based\_asg\_scaling\_policy) | True to create alb tg rpm based scaling policy | `bool` | `false` | no |
| <a name="input_create_cpu_based_asg_scaling_policy"></a> [create\_cpu\_based\_asg\_scaling\_policy](#input\_create\_cpu\_based\_asg\_scaling\_policy) | True to create asg cpu based scaling policy | `bool` | `false` | no |
| <a name="input_create_sqs_msgs_alarm_based_asg_scale_in_policy"></a> [create\_sqs\_msgs\_alarm\_based\_asg\_scale\_in\_policy](#input\_create\_sqs\_msgs\_alarm\_based\_asg\_scale\_in\_policy) | True to create sqs alarm based scale in policy | `bool` | `false` | no |
| <a name="input_create_sqs_msgs_alarm_based_asg_scale_out_policy"></a> [create\_sqs\_msgs\_alarm\_based\_asg\_scale\_out\_policy](#input\_create\_sqs\_msgs\_alarm\_based\_asg\_scale\_out\_policy) | True to create sqs alarm based scale out policy | `bool` | `false` | no |
| <a name="input_estimated_instance_warmup"></a> [estimated\_instance\_warmup](#input\_estimated\_instance\_warmup) | estimated\_instance\_warmup time in seconds | `number` | `300` | no |
| <a name="input_scale_in_adjustment_count"></a> [scale\_in\_adjustment\_count](#input\_scale\_in\_adjustment\_count) | scale\_in\_adjustment\_count is the number of units the ASG to scale in | `number` | `1` | no |
| <a name="input_scale_in_cooldown_seconds"></a> [scale\_in\_cooldown\_seconds](#input\_scale\_in\_cooldown\_seconds) | scale\_in cooldown time in seconds | `number` | `300` | no |
| <a name="input_scale_out_adjustment_count"></a> [scale\_out\_adjustment\_count](#input\_scale\_out\_adjustment\_count) | scale\_out\_adjustment\_count is the number of units the ASG to scale in | `number` | `1` | no |
| <a name="input_scale_out_cooldown_seconds"></a> [scale\_out\_cooldown\_seconds](#input\_scale\_out\_cooldown\_seconds) | scale\_in cooldown time in seconds | `number` | `300` | no |
| <a name="input_sqs_msgs_high_alarm_datapoints_to_alarm"></a> [sqs\_msgs\_high\_alarm\_datapoints\_to\_alarm](#input\_sqs\_msgs\_high\_alarm\_datapoints\_to\_alarm) | sqs\_msgs\_low alarm number of datapoints match condition to activate alarm | `number` | `5` | no |
| <a name="input_sqs_msgs_high_alarm_evaluation_periods"></a> [sqs\_msgs\_high\_alarm\_evaluation\_periods](#input\_sqs\_msgs\_high\_alarm\_evaluation\_periods) | how many times to evaluate the alarm condition with evaluation period | `number` | `5` | no |
| <a name="input_sqs_msgs_high_alarm_periods"></a> [sqs\_msgs\_high\_alarm\_periods](#input\_sqs\_msgs\_high\_alarm\_periods) | sqs\_msgs\_low alarm periods in seconds | `number` | `60` | no |
| <a name="input_sqs_msgs_high_alarm_threshold"></a> [sqs\_msgs\_high\_alarm\_threshold](#input\_sqs\_msgs\_high\_alarm\_threshold) | sqs\_msgs\_low alarm threshold | `number` | n/a | yes |
| <a name="input_sqs_msgs_low_alarm_datapoints_to_alarm"></a> [sqs\_msgs\_low\_alarm\_datapoints\_to\_alarm](#input\_sqs\_msgs\_low\_alarm\_datapoints\_to\_alarm) | sqs\_msgs\_low alarm number of datapoints match condition to\_alarm | `number` | `5` | no |
| <a name="input_sqs_msgs_low_alarm_evaluation_periods"></a> [sqs\_msgs\_low\_alarm\_evaluation\_periods](#input\_sqs\_msgs\_low\_alarm\_evaluation\_periods) | how many times to evaluate the alarm condition within the period | `number` | `5` | no |
| <a name="input_sqs_msgs_low_alarm_periods"></a> [sqs\_msgs\_low\_alarm\_periods](#input\_sqs\_msgs\_low\_alarm\_periods) | sqs\_msgs\_low alarm periods | `number` | `60` | no |
| <a name="input_sqs_msgs_low_alarm_threshold"></a> [sqs\_msgs\_low\_alarm\_threshold](#input\_sqs\_msgs\_low\_alarm\_threshold) | sqs\_msgs\_low alarm threshold | `number` | n/a | yes |
| <a name="input_sqs_queue_name"></a> [sqs\_queue\_name](#input\_sqs\_queue\_name) | sqs\_queue\_name for the alarm | `string` | n/a | yes |

## Outputs

No outputs.