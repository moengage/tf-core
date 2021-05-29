## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| business\_name | Business Name | string | n/a | yes |
| created\_by | Created By | string | n/a | yes |
| environment | Environment | string | n/a | yes |
| lb\_is\_internal | If true, the LB will be internal | string | n/a | yes |
| lb\_subnets | Subnet IDS where AWS will launch load balancer | list | n/a | yes |
| service\_name | Service Name | string | n/a | yes |
| vpc\_id | VPC ID | string | n/a | yes |
| aws\_lb\_accounts | Use the account ID that corresponds to the region for your load balancer and bucket | map | `<map>` | no |
| cluster | Cluster Name | string | `"default"` | no |
| lb\_access\_logs\_enabled | Boolean to enable / disable access_logs. Defaults to false, even when bucket is specified | string | `"false"` | no |
| lb\_certificate\_arn | The ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS. For adding additional SSL certificates | string | `""` | no |
| lb\_create\_security\_group | Create a security group for load balancer | string | `"true"` | no |
| lb\_create\_timeout | Used for Creating LB (Default 10 minutes) | string | `"10m"` | no |
| lb\_delete\_timeout | Used for destroying LB (Default 10 minutes) | string | `"10m"` | no |
| lb\_enable\_cross\_zone\_load\_balancing | If true, cross-zone load balancing of the load balancer will be enabled. This is a network load balancer feature. Defaults to false | string | `"false"` | no |
| lb\_enable\_deletion\_protection | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false | string | `"false"` | no |
| lb\_enable\_http2 | Indicates whether HTTP/2 is enabled. Defaults to true | string | `"true"` | no |
| lb\_enable\_http\_listener | If enabled one HTTP listener will be created | string | `"false"` | no |
| lb\_enable\_https\_listener | If enabled one HTTPS listener will be created | string | `"false"` | no |
| lb\_health\_check\_healthy\_thresold | The number of consecutive health checks successes required before considering an unhealthy target healthy. Defaults to 3 | string | `"3"` | no |
| lb\_health\_check\_interval | The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. Default 30 seconds | string | `"30"` | no |
| lb\_health\_check\_matcher\_status\_code | The HTTP codes to use when checking for a successful response from a target. You can specify multiple values (for example, '200,202') or a range of values (for example, '200-299') | string | `"200"` | no |
| lb\_health\_check\_path | The destination for the health check request | string | `"/"` | no |
| lb\_health\_check\_port | The port to use to connect with the target. Valid values are either ports 1-65536, or traffic-port. Defaults to traffic-port | string | `"traffic-port"` | no |
| lb\_health\_check\_protocol | The protocol to use to connect with the target. Defaults to HTTP | string | `"HTTP"` | no |
| lb\_health\_check\_timeout | The amount of time, in seconds, during which no response means a failed health check. For Application Load Balancers, the range is 2 to 60 seconds and the default is 5 seconds | string | `"5"` | no |
| lb\_health\_check\_unhealthy\_thresold | The number of consecutive health check failures required before considering the target unhealthy | string | `"3"` | no |
| lb\_https\_listener\_ssl\_policy | The name of the SSL Policy for the listener | string | `""` | no |
| lb\_idle\_timeout | The time in seconds that the connection is allowed to be idle | string | `"60"` | no |
| lb\_ip\_address\_type | The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack | string | `"ipv4"` | no |
| lb\_logs\_retention\_days | Specifies the number of days after object creation when the specific rule action takes effect | string | `"7"` | no |
| lb\_security\_groups | Security group IDs which will be associated with load balancer | list | `<list>` | no |
| lb\_update\_timeout | Used for LB modifications (Default 10 minutes) | string | `"10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn |  |
| arn\_suffix |  |
| dns\_name |  |
| http\_listener\_arn |  |
| https\_listener\_arn |  |
| id |  |
| security\_group |  |
| target\_group\_arn |  |
| zone\_id |  |

