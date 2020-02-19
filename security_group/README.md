## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster | Cluster Name | string | n/a | yes |
| created\_by | Created By | string | n/a | yes |
| environment | Environment | string | n/a | yes |
| vpc_id | VPC ID | string | n/a | yes |
| resource_type | Resource Type (public/private/cluster) | string | n/a | yes |
| resource_group | Resource Group | string | n/a | yes |
| create_before_destroy | Create SG before destroying | bool | true | no |
| sg_description | The security group description | string | n/a | yes |
| allow_all_egress | Add an allow all egress rule to the SG | bool | true | no |


## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the security group |
| arn | The ARN of the security group |
| vpc_id | The VPC ID |
| owner_id | The owner ID |
| name | The name of the security group |
| description | The description of the security group |
