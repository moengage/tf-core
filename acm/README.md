## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.acm"></a> [aws.acm](#provider\_aws.acm) | n/a |
| <a name="provider_aws.route53"></a> [aws.route53](#provider\_aws.route53) | n/a |

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
| <a name="input_domain_names"></a> [domain\_names](#input\_domain\_names) | List of domains to associate with the new certificate. ACM currently supports up to 10 domains, any or all of which can contain wildcards. The first domain should be the primary domain | `list` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The Route53 zone ID in which to create validation records | `string` | `""` | no |
| <a name="input_zone_ids"></a> [zone\_ids](#input\_zone\_ids) | Map of zone IDs indexed by domain name (when issuing a certificate spanning multiple zones) | `map` | `{}` | no |

domain_names = ["foo.net", "*.foo.net", "bar.org", "foo.bar.org"]
zone_ids = {
    "foo.net" = "foo_zone_id"
    "*.foo.net" = "foo_net_zone_id"
    "bar.org" = "bar_org_zone_id"
    "foo.bar.org" = "foo_bar_org_zone_id"
}

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the issued certificate |