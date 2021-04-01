## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_lambda_function.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_business_name"></a> [business\_name](#input\_business\_name) | A Business tag will be used on aws resources for costs calculation | `any` | n/a | yes |
| <a name="input_created_by"></a> [created\_by](#input\_created\_by) | A maintainer tag will be added to aws launched resources | `any` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description for your Lambda Function | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | An environment tag will be used on aws resources | `any` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | A map that defines environment variables for the Lambda Function. | `map(string)` | `{}` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | extra tags to be appended to the lambda | `map(string)` | `{}` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | The absolute path to a local file or directory containing your Lambda source code this must be in zip format | `string` | `""` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | A unique name for your Lambda Function | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | n/a | `string` | `"main.lambda_handler"` | no |
| <a name="input_lambda_role"></a> [lambda\_role](#input\_lambda\_role) | IAM role ARN attached to the Lambda Function | `string` | n/a | yes |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | n/a | `number` | `256` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Lambda Function runtime | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Service name will be used for components in business | `any` | n/a | yes |
| <a name="input_subservice_name"></a> [subservice\_name](#input\_subservice\_name) | SubService name will be used for exact function what will be this used for | `any` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | n/a | `number` | `60` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of security group ids when Lambda Function should run in the VPC. | `list(string)` | n/a | yes |
| <a name="input_vpc_subnet_ids"></a> [vpc\_subnet\_ids](#input\_vpc\_subnet\_ids) | List of subnet ids when Lambda Function should run in the VPC. Usually private or intra subnets. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | The name of the Lambda function |
