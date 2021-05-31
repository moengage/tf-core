## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb_default_alarm"></a> [alb\_default\_alarm](#module\_alb\_default\_alarm) | git@github.com:moengage/tf-core.git//cloudwatch/alb_alarms?ref=master |  |

## Resources

| Name | Type |
|------|------|
| [aws_lb.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_s3_bucket.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | AWS SNS topic or AutoScaling policy ARN or any other supported action's ARNs in List | `list(any)` | n/a | yes |
| <a name="input_create_default_alarms"></a> [alb\_default\_alarm\_creation](#input\_alb\_default\_alarm\_creation) | 1 to enable default alarms for the alb. 0 to ignore | `number` | `0` | no |
| <a name="input_aws_lb_accounts"></a> [aws\_lb\_accounts](#input\_aws\_lb\_accounts) | Use the account ID that corresponds to the region for your load balancer and bucket | `map(string)` | <pre>{<br>  "ap-east-1": "754344448648",<br>  "ap-northeast-1": "582318560864",<br>  "ap-northeast-2": "600734575887",<br>  "ap-northeast-3": "383597477331",<br>  "ap-south-1": "718504428378",<br>  "ap-southeast-1": "114774131450",<br>  "ap-southeast-2": "783225319266",<br>  "ca-central-1": "985666609251",<br>  "eu-central-1": "054676820928",<br>  "eu-north-1": "897822967062",<br>  "eu-west-1": "156460612806",<br>  "eu-west-2": "652711504416",<br>  "eu-west-3": "009996457667",<br>  "sa-east-1": "507241528517",<br>  "us-east-1": "127311923021",<br>  "us-east-2": "033677994240",<br>  "us-west-1": "027434742980",<br>  "us-west-2": "797873946194"<br>}</pre> | no |
| <a name="input_business_name"></a> [business\_name](#input\_business\_name) | Business Name | `any` | n/a | yes |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Cluster Name | `string` | `"default"` | no |
| <a name="input_created_by"></a> [created\_by](#input\_created\_by) | Created By | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `any` | n/a | yes |
| <a name="input_error_rate_threshold"></a> [error\_rate\_threshold](#input\_error\_rate\_threshold) | The threshold for Error rate in percentage | `number` | `0.5` | no |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | The number of periods over which data is compared to the specified threshold | `number` | `2` | no |
| <a name="input_lb_access_logs_enabled"></a> [lb\_access\_logs\_enabled](#input\_lb\_access\_logs\_enabled) | Boolean to enable / disable access\_logs. Defaults to false, even when bucket is specified | `bool` | `false` | no |
| <a name="input_lb_certificate_arn"></a> [lb\_certificate\_arn](#input\_lb\_certificate\_arn) | The ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS. For adding additional SSL certificates | `string` | `""` | no |
| <a name="input_lb_create_security_group"></a> [lb\_create\_security\_group](#input\_lb\_create\_security\_group) | Create a security group for load balancer | `bool` | `true` | no |
| <a name="input_lb_create_timeout"></a> [lb\_create\_timeout](#input\_lb\_create\_timeout) | Used for Creating LB (Default 10 minutes) | `string` | `"10m"` | no |
| <a name="input_lb_delete_timeout"></a> [lb\_delete\_timeout](#input\_lb\_delete\_timeout) | Used for destroying LB (Default 10 minutes) | `string` | `"10m"` | no |
| <a name="input_lb_enable_cross_zone_load_balancing"></a> [lb\_enable\_cross\_zone\_load\_balancing](#input\_lb\_enable\_cross\_zone\_load\_balancing) | If true, cross-zone load balancing of the load balancer will be enabled. This is a network load balancer feature. Defaults to false | `bool` | `false` | no |
| <a name="input_lb_enable_deletion_protection"></a> [lb\_enable\_deletion\_protection](#input\_lb\_enable\_deletion\_protection) | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false | `bool` | `false` | no |
| <a name="input_lb_enable_http2"></a> [lb\_enable\_http2](#input\_lb\_enable\_http2) | Indicates whether HTTP/2 is enabled. Defaults to true | `bool` | `true` | no |
| <a name="input_lb_enable_http_listener"></a> [lb\_enable\_http\_listener](#input\_lb\_enable\_http\_listener) | If enabled one HTTP listener will be created | `bool` | `false` | no |
| <a name="input_lb_enable_https_listener"></a> [lb\_enable\_https\_listener](#input\_lb\_enable\_https\_listener) | If enabled one HTTPS listener will be created | `bool` | `false` | no |
| <a name="input_lb_health_check_healthy_thresold"></a> [lb\_health\_check\_healthy\_thresold](#input\_lb\_health\_check\_healthy\_thresold) | The number of consecutive health checks successes required before considering an unhealthy target healthy. Defaults to 3 | `number` | `3` | no |
| <a name="input_lb_health_check_interval"></a> [lb\_health\_check\_interval](#input\_lb\_health\_check\_interval) | The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. Default 30 seconds | `number` | `30` | no |
| <a name="input_lb_health_check_matcher_status_code"></a> [lb\_health\_check\_matcher\_status\_code](#input\_lb\_health\_check\_matcher\_status\_code) | The HTTP codes to use when checking for a successful response from a target. You can specify multiple values (for example, '200,202') or a range of values (for example, '200-299') | `number` | `200` | no |
| <a name="input_lb_health_check_path"></a> [lb\_health\_check\_path](#input\_lb\_health\_check\_path) | The destination for the health check request | `string` | `"/"` | no |
| <a name="input_lb_health_check_port"></a> [lb\_health\_check\_port](#input\_lb\_health\_check\_port) | The port to use to connect with the target. Valid values are either ports 1-65536, or traffic-port. Defaults to traffic-port | `string` | `"traffic-port"` | no |
| <a name="input_lb_health_check_protocol"></a> [lb\_health\_check\_protocol](#input\_lb\_health\_check\_protocol) | The protocol to use to connect with the target. Defaults to HTTP | `string` | `"HTTP"` | no |
| <a name="input_lb_health_check_timeout"></a> [lb\_health\_check\_timeout](#input\_lb\_health\_check\_timeout) | The amount of time, in seconds, during which no response means a failed health check. For Application Load Balancers, the range is 2 to 60 seconds and the default is 5 seconds | `number` | `5` | no |
| <a name="input_lb_health_check_unhealthy_thresold"></a> [lb\_health\_check\_unhealthy\_thresold](#input\_lb\_health\_check\_unhealthy\_thresold) | The number of consecutive health check failures required before considering the target unhealthy | `number` | `3` | no |
| <a name="input_lb_https_listener_ssl_policy"></a> [lb\_https\_listener\_ssl\_policy](#input\_lb\_https\_listener\_ssl\_policy) | The name of the SSL Policy for the listener | `string` | `""` | no |
| <a name="input_lb_idle_timeout"></a> [lb\_idle\_timeout](#input\_lb\_idle\_timeout) | The time in seconds that the connection is allowed to be idle | `number` | `60` | no |
| <a name="input_lb_ip_address_type"></a> [lb\_ip\_address\_type](#input\_lb\_ip\_address\_type) | The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack | `string` | `"ipv4"` | no |
| <a name="input_lb_is_internal"></a> [lb\_is\_internal](#input\_lb\_is\_internal) | If true, the LB will be internal | `any` | n/a | yes |
| <a name="input_lb_logs_retention_days"></a> [lb\_logs\_retention\_days](#input\_lb\_logs\_retention\_days) | Specifies the number of days after object creation when the specific rule action takes effect | `number` | `7` | no |
| <a name="input_lb_security_groups"></a> [lb\_security\_groups](#input\_lb\_security\_groups) | Security group IDs which will be associated with load balancer | `list(string)` | `[]` | no |
| <a name="input_lb_subnets"></a> [lb\_subnets](#input\_lb\_subnets) | Subnet IDS where AWS will launch load balancer | `list(string)` | n/a | yes |
| <a name="input_lb_update_timeout"></a> [lb\_update\_timeout](#input\_lb\_update\_timeout) | Used for LB modifications (Default 10 minutes) | `string` | `"10m"` | no |
| <a name="input_metric_period"></a> [metric\_period](#input\_metric\_period) | The period in seconds over which the specified statistic is applied | `number` | `300` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Service Name | `any` | n/a | yes |
| <a name="input_subservice_name"></a> [subservice\_name](#input\_subservice\_name) | Sub Service Name | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_arn_suffix"></a> [arn\_suffix](#output\_arn\_suffix) | n/a |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | n/a |
| <a name="output_http_listener_arn"></a> [http\_listener\_arn](#output\_http\_listener\_arn) | n/a |
| <a name="output_https_listener_arn"></a> [https\_listener\_arn](#output\_https\_listener\_arn) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_security_group"></a> [security\_group](#output\_security\_group) | n/a |
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | n/a |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | n/a |
