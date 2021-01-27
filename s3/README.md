## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acl | The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write. Defaults to private | `string` | `"private"` | no |
| bucket\_name | Bucket Name | `any` | n/a | yes |
| business\_name | Business Name | `any` | n/a | yes |
| cluster | Cluster identifier | `string` | `"default"` | no |
| created\_by | Owner | `any` | n/a | yes |
| environment | Environment name | `any` | n/a | yes |
| region | AWS Region | `any` | n/a | yes |
| service\_name | Service Name | `any` | n/a | yes |
| subservice\_name | Sub Service Name | `any` | n/a | yes |
| team\_name | Team Name | `any` | n/a | yes |
| unique\_prefix | Unique prefix which will be appended to S3 bucket name and dynamodb table name | `string` | `"moe"` | no |
| versioning\_enabled | Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket | Bucket ID |

