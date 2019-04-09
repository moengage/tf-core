## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| created\_by | ID of provisioner | string | n/a | yes |
| environment | Environment name | string | n/a | yes |
| unique\_prefix | Unique prefix which will be appended to S3 bucket name and dynamodb table name | string | n/a | yes |
| cluster | Cluster identifier | string | `"default"` | no |
| dynamodb\_read\_capacity\_unit | DynamoDB read capacity units | string | `"5"` | no |
| dynamodb\_write\_capacity\_unit | DynamoDB write capacity units | string | `"5"` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket |  |
| dynamodb\_table |  |

