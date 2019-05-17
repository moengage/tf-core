## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| associate\_public\_ip\_address | Associate a public ip address with the network interface. Boolean value. | string | n/a | yes |
| business\_name | Business Name | string | n/a | yes |
| cluster | Cluster Name | string | n/a | yes |
| created\_by | Created By | string | n/a | yes |
| environment | Environment | string | n/a | yes |
| fab\_tag | Fab Tag | string | n/a | yes |
| image\_id | AMI ID to use | string | n/a | yes |
| instance\_security\_group\_ids | Security Group IDs which will be attached to launched instances | list | n/a | yes |
| key\_name | Key Pair to use when launching instances | string | n/a | yes |
| monitoring\_enabled | If true, the launched EC2 instance will have detailed monitoring enabled | string | n/a | yes |
| service\_name | Service name | string | n/a | yes |
| volume\_size | The size of the volume in gigabytes | string | n/a | yes |
| cpu\_credits | The credit option for CPU usage. Can be standard or unlimited. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default | string | `"unlimited"` | no |
| delete\_network\_interfaces\_on\_termination | Whether the network interface should be destroyed on instance termination | string | `"true"` | no |
| device\_name | The name of the device to mount | string | `"/dev/sda1"` | no |
| ebs\_optimized | If true, the launched EC2 instance will be EBS-optimized | string | `"true"` | no |
| iam\_instance\_profile | The IAM Instance Profile to launch the instance with | string | `""` | no |
| service\_type | Service Type | string | `""` | no |

