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
| [aws_acm_certificate.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_business_name"></a> [business\_name](#input\_business\_name) | Business Name | `string` | n/a | yes |
| <a name="input_domain_names"></a> [domain\_names](#input\_domain\_names) | List of domains to associate with the new certificate. ACM currently supports up to 10 domains, any or all of which can contain wildcards. The first domain should be the primary domain | `list` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | environment to deploy into, should typically dev/staging/prod | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Service name | `string` | n/a | yes |
| <a name="input_subservice_name"></a> [subservice\_name](#input\_subservice\_name) | Sub Service name | `string` | n/a | yes |
| <a name="input_zone_ids"></a> [zone\_ids](#input\_zone\_ids) | Map of zone IDs indexed by domain name (when issuing a certificate spanning multiple zones) | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the issued certificate |