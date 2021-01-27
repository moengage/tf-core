## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| business\_name | Business Name | `any` | n/a | yes |
| cluster | Cluster identifier | `string` | `"default"` | no |
| created\_by | Owner | `any` | n/a | yes |
| environment | Environment name | `any` | n/a | yes |
| region | AWS Region | `any` | n/a | yes |
| service\_name | Service Name | `any` | n/a | yes |
| subservice\_name | Sub Service Name | `any` | n/a | yes |
| unique\_prefix | Unique prefix which will be appended to S3 bucket name and dynamodb table name | `string` | `"moe"` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket | Bucket ID |

