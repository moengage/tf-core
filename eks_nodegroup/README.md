## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| architecture | Architecture, supported types are amd64, arm64, amd64-accelerated | `string` | `"amd64"` | no |
| associate\_public\_ip\_address | Whether to associate public ip address to instances | `any` | n/a | yes |
| bootstrap\_extra\_args | n/a | `string` | `""` | no |
| business\_name | business name tag | `any` | n/a | yes |
| cluster\_autoscaler\_enabled | Add cluster autoscaler tags | `bool` | `true` | no |
| cluster\_name | n/a | `any` | n/a | yes |
| cluster\_version | n/a | `any` | n/a | yes |
| created\_by | Creator | `any` | n/a | yes |
| default\_cooldown | n/a | `any` | n/a | yes |
| desired\_capacity | n/a | `any` | n/a | yes |
| ecr\_cross\_account\_registry\_ids | List of AWS ECR registry ids/account ids | `list(string)` | `[]` | no |
| environment | n/a | `any` | n/a | yes |
| extra\_asg\_tags | n/a | `list(object({ key = string, propagate_at_launch = bool, value = string }))` | `[]` | no |
| fab\_tag | n/a | `string` | `"kubernetes"` | no |
| health\_check\_type | n/a | `any` | n/a | yes |
| image\_id | AMI to use, if not specified latest EKS Optimized AMI will be used | `string` | `""` | no |
| instance\_subnet\_ids | n/a | `list(string)` | n/a | yes |
| instance\_types | List of instance types, ordered priority, less index more priority | `list(string)` | n/a | yes |
| key\_name | n/a | `any` | n/a | yes |
| kubernetes\_namespace | n/a | `string` | `"default"` | no |
| max\_size | n/a | `any` | n/a | yes |
| min\_size | n/a | `any` | n/a | yes |
| on\_demand\_percentage\_above\_base\_capacity | n/a | `any` | n/a | yes |
| region | Region Name | `any` | n/a | yes |
| service\_name | n/a | `any` | n/a | yes |
| spot\_allocation\_strategy | n/a | `string` | `"capacity-optimized"` | no |
| spot\_instance\_pools | n/a | `number` | `0` | no |
| subservice\_name | n/a | `string` | `""` | no |
| target\_group\_arns | n/a | `list` | `[]` | no |
| volume\_size | n/a | `any` | n/a | yes |
| vpc\_id | n/a | `any` | n/a | yes |

## Outputs

No output.

