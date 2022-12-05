## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| sqs\_name | SQS Name | `any` | n/a | yes |
| business\_name | Business Name | `any` | n/a | yes |
| cluster | Cluster identifier | `string` | `"default"` | no |
| created\_by | Owner | `any` | n/a | yes |
| environment | Environment name | `any` | n/a | yes |
| region | AWS Region | `any` | n/a | yes |
| service\_name | Service Name | `any` | n/a | yes |
| subservice\_name | Sub Service Name | `any` | n/a | yes |
| team\_name | Team Name | `any` | n/a | yes |
| sqs\_delay\_seconds | SQS delay seconds  | `integer` | `0` | no |
| sqs\_max\_message\_size | SQS Max Message Size | `integer` | `262144` | no |
| sqs\_message\_retention\_seconds | SQS Message Retention Seconds | `integer` | `345600` | no |
| sqs\_receive\_wait\_time\_seconds | SQS Receive Wait Time seconds | `integer` | `0` | no |
| sqs\_visibility\_timeout\_seconds | SQS Visibility timeout seconds | `integer` | `1800` | no |
| create_sqs_default_alarms | Create SQS alarm | `bool` | `true` | no |
| sqs_alarm_metric_period | The period in seconds over which the specified statistic is applied | `integer` | `60` | no |
| sqs_alarm_datapoints_to_alarm | The number of datapoints to check before alarming | `integer` | `5` | no |
| sqs_alarm_evaluation_periods | The number of periods over which data is compared to the specified threshold | `integer` | `5` | no |
| sqs_alarm_msgs_threshold | The threshold for approximate number of messages for the queue | `integer` | `100` | no |
| sqs_alarm_actions | The Alarm actions arn in list | `list` | n/a | yes |
| sqs_ok_actions | The OK actions arn in list | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| sqs_arn | SQS ARN |
| sqs_alarm_arns | SQS Alarm ARNS |

