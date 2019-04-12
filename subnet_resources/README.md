## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability\_zones | Availability zones list in which management subnets and respective infrastructure will be created | list | n/a | yes |
| business\_name | Business/Team Name | string | n/a | yes |
| created\_by | ID of provisioner | string | n/a | yes |
| environment | Environment name | string | n/a | yes |
| nat\_gateways | availability_zones and nat_gateway_ids map | map | n/a | yes |
| private\_subnets | availability_zones and CIDR map | map | n/a | yes |
| public\_subnets | availability_zones and CIDR map | map | n/a | yes |
| region | Region name | string | n/a | yes |
| vpc\_id | VPC ID | string | n/a | yes |
| cluster | Cluster name | string | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| private\_nacls |  |
| private\_subnets |  |
| public\_subnets |  |

