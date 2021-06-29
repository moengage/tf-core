## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.ebs_volume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_volume_attachment.volume_attachement](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID to use for launching this instance | `any` | n/a | yes |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Whether to associate a public IP to this instance | `any` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | AWS Availability zones where instances should be launched | `list(string)` | n/a | yes |
| <a name="input_business_name"></a> [business\_name](#input\_business\_name) | A Business tag will be used on aws resources for costs calculation | `any` | n/a | yes |
| <a name="input_created_by"></a> [created\_by](#input\_created\_by) | A maintainer tag will be added to aws launched resources | `any` | n/a | yes |
| <a name="input_ebs_volume_count"></a> [ebs\_volume\_count](#input\_ebs\_volume\_count) | No of EBS volumes to be attached per instance | `number` | `0` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | Disk Volume Size for all ebs attached disks | `number` | `20` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | n/a | `string` | `"gp3"` | no |
| <a name="input_ec2_device_names"></a> [ec2\_device\_names](#input\_ec2\_device\_names) | Name of the EBS device to mount | `list(string)` | <pre>[<br>  "/dev/xvdb",<br>  "/dev/xvdc",<br>  "/dev/xvdd",<br>  "/dev/xvde",<br>  "/dev/xvdf",<br>  "/dev/xvdg",<br>  "/dev/xvdh",<br>  "/dev/xvdi",<br>  "/dev/xvdj",<br>  "/dev/xvdk",<br>  "/dev/xvdl",<br>  "/dev/xvdm",<br>  "/dev/xvdn",<br>  "/dev/xvdo",<br>  "/dev/xvdp",<br>  "/dev/xvdq",<br>  "/dev/xvdr",<br>  "/dev/xvds",<br>  "/dev/xvdt",<br>  "/dev/xvdu",<br>  "/dev/xvdv",<br>  "/dev/xvdw",<br>  "/dev/xvdx",<br>  "/dev/xvdy",<br>  "/dev/xvdz"<br>]</pre> | no |
| <a name="input_ec2_instance_count"></a> [ec2\_instance\_count](#input\_ec2\_instance\_count) | the numbers of EC2 instances to be launched | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | An environment tag will be used on aws resources | `any` | n/a | yes |
| <a name="input_extra_instance_tags"></a> [extra\_instance\_tags](#input\_extra\_instance\_tags) | Extra tags for instances to be launched in ASG | `map(string)` | `{}` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | IAM role for this instance | `string` | `""` | no |
| <a name="input_instance_keyname"></a> [instance\_keyname](#input\_instance\_keyname) | SSH KeyPair name for this instance | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | AWS Instance Type for the instance - eg c6g.xlarge/m5.2xlarge | `any` | n/a | yes |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | Size of the Root Disk Volume | `number` | `20` | no |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | Root Disk Volume Type - Allowed values = gp2/gp3/st1 | `string` | `"gp3"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group ids to be assigned to this instance | `list(string)` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Service name will be used in DNS, naming resources, costs calculation etc, | `any` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnets where this instance can be launched | `list(string)` | n/a | yes |
| <a name="input_subservice_name"></a> [subservice\_name](#input\_subservice\_name) | SubService name will be used in DNS, naming resources etc, | `any` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | user data for the instance | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | List of IDs of instances |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | List of private IP addresses assigned to the instances |
