## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| associate\_public\_ip\_address | Whether to associate public ip address to instances | `any` | n/a | yes |
| business\_name | business name tag | `any` | n/a | yes |
| cluster\_name | n/a | `any` | n/a | yes |
| cluster\_version | n/a | `any` | n/a | yes |
| created\_by | Creator | `any` | n/a | yes |
| default\_cooldown | n/a | `any` | n/a | yes |
| desired\_capacity | n/a | `any` | n/a | yes |
| environment | n/a | `any` | n/a | yes |
| health\_check\_type | n/a | `any` | n/a | yes |
| instance\_subnet\_ids | n/a | `list(string)` | n/a | yes |
| instance\_types | List of instance types, ordered priority, less index more priority | `list(string)` | n/a | yes |
| key\_name | n/a | `any` | n/a | yes |
| max\_size | n/a | `any` | n/a | yes |
| min\_size | n/a | `any` | n/a | yes |
| on\_demand\_percentage\_above\_base\_capacity | n/a | `any` | n/a | yes |
| region | Region Name | `any` | n/a | yes |
| service\_name | n/a | `any` | n/a | yes |
| volume\_size | n/a | `any` | n/a | yes |
| vpc\_id | n/a | `any` | n/a | yes |
| bootstrap\_extra\_args | n/a | `string` | `""` | no |
| cluster\_autoscaler\_enabled | Add cluster autoscaler tags | `bool` | `true` | no |
| ecr\_cross\_account\_registry\_ids | List of AWS ECR registry ids/account ids | `list` | `[]` | no |
| image\_id | AMI to use, if not specified latest EKS Optimized AMI will be used | `string` | `""` | no |

## Outputs

No output.

