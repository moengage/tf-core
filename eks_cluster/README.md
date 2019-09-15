## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| business | Business | string | n/a | yes |
| cluster | Cluster | string | n/a | yes |
| created\_by | Created By | string | n/a | yes |
| enable\_endpoint\_private\_access | Flag to enable private endpoint for EKS Master | string | n/a | yes |
| enable\_endpoint\_public\_access | Flag to enable public endpoint for EKS Master | string | n/a | yes |
| environment | Environment | string | n/a | yes |
| region | Region | string | n/a | yes |
| subnet\_ids | Subnet IDs where cluster will be created and managed by AWS | list | n/a | yes |
| team | Team | string | n/a | yes |
| vpc\_id | VPC ID | string | n/a | yes |
| authenticator\_command | Authenticator you use | string | `"aws-vault"` | no |
| create\_controlplane\_security\_group | Flag to create controlplane security group | string | `"true"` | no |
| create\_timeout | Create timeout | string | `"30m"` | no |
| create\_worker\_iam\_role | Flag to create worker node role | string | `"true"` | no |
| create\_worker\_security\_group | Flag to create worker security groups | string | `"true"` | no |
| delete\_timeout | Delete timeout | string | `"15m"` | no |
| enabled\_cluster\_log\_types | A list of the desired control plane logging to enable. Valid values are: api, audit, authenticator, controllerManager, scheduler | list | `<list>` | no |
| extra\_tags | Extra tags | map | `<map>` | no |
| iam\_role\_arn | If iam resources are not managed automatically, pass iam role arn which will be attached to cluster | string | `""` | no |
| log\_retention\_in\_days | If cluster logging enabled, Cloudwatch log retention in days | string | `"7"` | no |
| manage\_iam\_resources | Flag to manage iam resources | string | `"true"` | no |
| security\_group\_ids | Security groups which will be attached to EKS Master/controlplane | list | `<list>` | no |
| update\_timeout | Update timeout | string | `"30m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| config\_map\_aws\_auth | Kubernetes ConfigMap configuration for worker nodes to join the EKS cluster. https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html#required-kubernetes-configuration-to-join-worker-nodes |
| controlplane\_security\_group |  |
| endpoint |  |
| kubeconfig |  |
| kubeconfig\_certificate\_authority\_data |  |
| worker\_role\_arn |  |
| worker\_role\_name |  |
| worker\_security\_group |  |

