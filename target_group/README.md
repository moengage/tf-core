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
| cluster | Cluster Name | `any` | n/a | yes |
| created\_by | Created By | `any` | n/a | yes |
| deregistration\_delay | The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. The default value is 300 seconds. | `number` | `300` | no |
| enabled | Create resources | `bool` | `true` | no |
| environment | Environment | `any` | n/a | yes |
| health\_check\_enabled | Indicates whether health checks are enabled. Defaults to true. | `bool` | `true` | no |
| health\_check\_healthy\_thresold | The number of consecutive health checks successes required before considering an unhealthy target healthy. Defaults to 3. | `number` | `3` | no |
| health\_check\_interval | The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. Default 30 seconds. | `number` | `30` | no |
| health\_check\_matcher | The HTTP codes to use when checking for a successful response from a target. You can specify multiple values (for example, '200,202') or a range of values (for example, '200-299') | `any` | n/a | yes |
| health\_check\_path | The destination for the health check request | `any` | n/a | yes |
| health\_check\_port | The port to use to connect with the target. Valid values are either ports 1-65536, or traffic-port. Defaults to traffic-port | `string` | `"traffic-port"` | no |
| health\_check\_protocol | The protocol to use to connect with the target. Defaults to HTTP | `string` | `"HTTP"` | no |
| health\_check\_timeout | The amount of time, in seconds, during which no response means a failed health check. For Application Load Balancers, the range is 2 to 60 seconds and the default is 5 seconds. default is 10 seconds for TCP and HTTPS health checks and 6 seconds for HTTP health checks | `number` | `6` | no |
| health\_check\_unhealthy\_thresold | The number of consecutive health check failures required before considering the target unhealthy . For Network Load Balancers, this value must be the same as the healthy\_threshold. Defaults to 3. | `number` | `3` | no |
| port | The port on which targets receive traffic, unless overridden when registering a specific target | `any` | n/a | yes |
| service\_name | Service Name | `any` | n/a | yes |
| slow\_start | The amount time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable. The default value is 0 seconds. | `number` | `0` | no |
| stickiness\_cookie\_duration | The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds). | `number` | `86400` | no |
| stickiness\_enabled | Boolean to enable / disable stickiness. Default is true | `bool` | `true` | no |
| subservice\_name | SubService Name | `any` | n/a | yes |
| vpc\_id | VPC ID | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| arn\_suffix | n/a |
| name | n/a |

