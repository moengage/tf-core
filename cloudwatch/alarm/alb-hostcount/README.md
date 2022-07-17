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
| [aws_cloudwatch_metric_alarm.unhealthy_host_count_percentage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | AWS SNS topic or AutoScaling policy ARN or any other supported action's ARNs in List | `list(any)` | n/a | yes |
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | The readable load balancer name. Specify only the load balancer name, no /app/ prefix or numerical suffix. Example, app3-dashboard | `string` | n/a | yes |
| <a name="input_dimensions_loadbalancer"></a> [dimensions\_loadbalancer](#input\_dimensions\_loadbalancer) | Filters the metric data by load balancer. Specify the load balancer as follows: app/load-balancer-name/1234567890123456 | `string` | n/a | yes |
| <a name="input_error_rate_threshold"></a> [error\_rate\_threshold](#input\_error\_rate\_threshold) | The threshold for Error rate in percentage | `number` | `0.5` | no |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | The number of periods over which data is compared to the specified threshold | `number` | `2` | no |
| <a name="input_metric_period"></a> [metric\_period](#input\_metric\_period) | The period in seconds over which the specified statistic is applied | `number` | `300` | no |

## Outputs

No outputs.
