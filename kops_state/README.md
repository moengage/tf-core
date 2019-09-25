## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| created\_by | ID of provisioner | string | n/a | yes |
| environment | Environment name | string | n/a | yes |
| region | AWS Region | string | n/a | yes |
| unique\_prefix | Unique prefix which will be appended to S3 bucket name and dynamodb table name | string | n/a | yes |
| cluster | Cluster identifier | string | `"default"` | no |

