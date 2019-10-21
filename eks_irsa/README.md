## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| business | Business name | string | n/a | yes |
| created\_by | Created by | string | n/a | yes |
| eks\_cluster\_name | AWS EKS Cluster Name | string | n/a | yes |
| environment | Environment | string | n/a | yes |
| kubernetes\_service\_account\_name | Kubernetes Service Account Name | string | n/a | yes |
| kubernetes\_service\_account\_namespace | Kubernetes Service Account Namespace | string | n/a | yes |
| team | Team | string | n/a | yes |
| cluster | AWS Unique Resource Identifier | string | `"default"` | no |
| extra\_tags | Extra tags | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| role\_arn | ARN of role created for service account |
| role\_name | Name of Role created for service account |

