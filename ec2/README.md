## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami\_id | AMI ID to use for launching this instance | `any` | n/a | yes |
| associate\_public\_ip\_address | Whether to associate a public IP to this instance | `any` | n/a | yes |
| availability\_zones | AWS Availability zones where instances should be launched | `list(string)` | n/a | yes |
| business\_name | A Business tag will be used on aws resources for costs calculation | `any` | n/a | yes |
| created\_by | A maintainer tag will be added to aws launched resources | `any` | n/a | yes |
| ebs\_volume\_count | No of EBS volumes to be attached per instance | `number` | `0` | no |
| ebs\_volume\_size | Disk Volume Size for all ebs attached disks | `number` | `20` | no |
| ebs\_volume\_type | n/a | `string` | `"gp3"` | no |
| ec2\_device\_names | n/a | `list` | <pre>[<br>  "/dev/sdc",<br>  "/dev/sdd",<br>  "/dev/sde",<br>  "/dev/sdf"<br>]</pre> | no |
| ec2\_instance\_count | the numbers of EC2 instances to be launched | `any` | n/a | yes |
| environment | An environment tag will be used on aws resources | `any` | n/a | yes |
| extra\_instance\_tags | Extra tags for instances to be launched in ASG | `map(string)` | `{}` | no |
| fabtag | Promewtheus will use this for scrapping metrics | `any` | n/a | yes |
| instance\_keyname | SSH KeyPair name for this instance | `any` | n/a | yes |
| instance\_type | AWS Instance Type for the instance - eg c6g.xlarge/m5.2xlarge | `any` | n/a | yes |
| root\_volume\_size | Size of the Root Disk Volume | `number` | `20` | no |
| root\_volume\_type | Root Disk Volume Type - Allowed values = gp2/gp3/st1 | `string` | `"gp3"` | no |
| security\_group\_ids | List of security group ids to be assigned to this instance | `list(string)` | n/a | yes |
| service\_name | Service name will be used in DNS, naming resources, costs calculation etc, | `any` | n/a | yes |
| subnet\_ids | Subnets where this instance can be launched | `list(string)` | n/a | yes |
| subservice\_name | SubService name will be used in DNS, naming resources etc, | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | List of IDs of instances |
| private\_ip | List of private IP addresses assigned to the instances |

