## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| availability\_zones | Availability zones list in which management subnets and respective infrastructure will be created | list | n/a | yes |
| created\_by | ID of provisioner | string | n/a | yes |
| environment | Environment name | string | n/a | yes |
| management\_public\_subnets | Public subnets where NAT gateways will be launched | map | n/a | yes |
| management\_private\_subnets | Private subnets with 0.0.0.0/0 route to NAT-GW | map | n/a | yes |
| management\_intra\_subnets | Intra subnets with only local traffic | map | n/a | yes |
| region | Region name | string | n/a | yes |
| vpc\_cidr | VPC CIDR | string | n/a | yes |
| cluster | Cluster name | string | `"default"` | no |
| enable\_flow\_logs | Whether to enable vpc flow logs | string | `"false"` | no |
| flow\_logs\_retention\_in\_days | VPC flow logs retention time in S3 in days | string | `"7"` | no |
| route53_zone_list | List of privae route_53 hosted names | list | `"[]"` | no

## Outputs

| Name | Description |
|------|-------------|
| igw\_id | Internet Gateway ID |
| nat\_gws | NAT Gateway IDs - NAT Gateway Private IPs - NAT Gateway Public Elastic IPs |
| s3\_vpc\_endpoint | S3 VPC Endpoint - State |
| vpc | VPC ID - CIDR Block |

