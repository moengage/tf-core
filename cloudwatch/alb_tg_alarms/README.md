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
| [aws_cloudwatch_metric_alarm.tg-5xx-alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.tg-health-hosts-alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.tg-response-time-alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | The Alarm actions arn in list | `list(any)` | n/a | yes |
| <a name="input_dimensions_loadbalancer"></a> [dimensions\_loadbalancer](#input\_dimensions\_loadbalancer) | Filters the metric data by load balancer. Specify the load balancer as follows: app/load-balancer-name/1234567890123456 | `string` | n/a | yes |
| <a name="input_dimensions_targetgroup"></a> [dimensions\_targetgroup](#input\_dimensions\_targetgroup) | Filters the metric data by load balancer. Specify the load balancer as follows: app/load-balancer-name/1234567890123456 | `string` | n/a | yes |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | The number of periods over which data is compared to the specified threshold | `number` | `2` | no |
| <a name="input_healthy_hosts_threshold"></a> [healthy\_hosts\_threshold](#input\_healthy\_hosts\_threshold) | The threshold for Healthy Host Count per TG | `number` | `1` | no |
| <a name="input_metric_period"></a> [metric\_period](#input\_metric\_period) | The period in seconds over which the specified statistic is applied | `number` | `300` | no |
| <a name="input_tg_error_rate_threshold"></a> [tg\_error\_rate\_threshold](#input\_tg\_error\_rate\_threshold) | The threshold for Error rate in percentage | `number` | `0.5` | no |
| <a name="input_tg_name"></a> [tg\_name](#input\_tg\_name) | The Target Group Name | `string` | n/a | yes |
| <a name="input_tg_resp_time_threshold"></a> [tg\_resp\_time\_threshold](#input\_tg\_resp\_time\_threshold) | The threshold for TG response time | `number` | `1` | no |

## Outputs

No outputs.
