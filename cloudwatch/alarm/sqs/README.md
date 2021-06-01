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
| [aws_cloudwatch_metric_alarm.sqs-msgs-alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | The Alarm actions arn in list | `list(any)` | n/a | yes |
| <a name="input_datapoints_to_alarm"></a> [datapoints\_to\_alarm](#input\_datapoints\_to\_alarm) | The number of datapoints to check before alarming | `number` | `2` | no |
| <a name="input_dimensions_queuename"></a> [dimensions\_queuename](#input\_dimensions\_queuename) | the SQS Queue name | `string` | n/a | yes |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | The number of periods over which data is compared to the specified threshold | `number` | `2` | no |
| <a name="input_metric_period"></a> [metric\_period](#input\_metric\_period) | The period in seconds over which the specified statistic is applied | `number` | `300` | no |
| <a name="input_sqs_msgs_threshold"></a> [sqs\_msgs\_threshold](#input\_sqs\_msgs\_threshold) | The threshold for approximate number of messages for the queue | `number` | n/a | yes |

## Outputs

No outputs.
