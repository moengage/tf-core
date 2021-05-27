## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allocated\_storage | The allocated storage in gibibytes. | `string` | n/a | yes |
| allow\_major\_version\_upgrade | Indicates that major version upgrades are allowed. | `string` | `true` | no |
| apply\_immediately | Specifies whether any database modifications are applied immediately, or during the next maintenance window. | `string` | `false` | no |
| auto\_minor\_version\_upgrade | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window.. | `string` | `false` | no |
| backup\_retention\_period | The days to retain backups for. Must be between 0 and 35. | `string` | `"30"` | no |
| backup\_window | The daily time range (in UTC) during which automated backups are created if they are enabled. | `string` | `""` | no |
| business\_name | Business name. | `string` | n/a | yes |
| ca\_cert\_identifier | The identifier of the CA certificate for the DB instance. | `string` | `"rds-ca-2019"` | no |
| character\_set | The database character set. | `string` | `"utf8mb4"` | no |
| collation | The database collation. | `string` | `"utf8mb4_bin"` | no |
| copy\_tags\_to\_snapshot | On delete, copy all Instance tags to the final snapshot. | `string` | `true` | no |
| deletion\_protection | If the DB instance should have deletion protection enabled. | `string` | `true` | no |
| description | The description of the all resources. | `string` | `"Managed by Terraform"` | no |
| enabled\_cloudwatch\_logs\_exports | List of log types to enable for exporting to CloudWatch logs. | `list(string)` | `[]` | no |
| engine\_version | The engine version to use. | `string` | n/a | yes |
| environment | environment to deploy into, should typically dev/staging/prod | `string` | n/a | yes |
| final\_snapshot\_identifier | The name of your final DB snapshot when this DB instance is deleted. | `string` | `"final-snapshot"` | no |
| iam\_database\_authentication\_enabled | Specifies whether or mappings of IAM accounts to database accounts is enabled. | `string` | `true` | no |
| instance\_class | The instance type of the RDS instance. | `string` | n/a | yes |
| iops | The amount of provisioned IOPS. Setting this implies a storage\_type of io1. | `string` | `0` | no |
| kms\_key\_id | The ARN for the KMS encryption key. | `string` | `""` | no |
| license\_model | License model information for this DB instance. | `string` | `"general-public-license"` | no |
| maintenance\_window | The window to perform maintenance in. | `string` | `""` | no |
| major\_engine\_version | Specifies the major version of the engine that this option group should be associated with. | `string` | `"5.7"` | no |
| monitoring\_interval | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. | `string` | `0` | no |
| monitoring\_role\_arn | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. | `string` | `""` | no |
| multi\_az | Specifies if the RDS instance is multi-AZ. | `bool` | `false` | no |
| password | Password for the master DB user. | `string` | n/a | yes |
| port | The port on which the DB accepts connections. | `string` | `3306` | no |
| publicly\_accessible | Bool to control if instance is publicly accessible. | `string` | `false` | no |
| service\_name | The service name of the database to create when the DB instance is created. | `string` | n/a | yes |
| skip\_final\_snapshot | Determines whether a final DB snapshot is created before the DB instance is deleted. | `string` | `false` | no |
| snapshot\_identifier | The DB snapshot used when DB instance is created. | `string` | `""` | no |
| storage\_encrypted | Specifies whether the DB instance is encrypted. | `string` | `true` | no |
| storage\_type | One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD). | `string` | `"gp2"` | no |
| subnet\_ids | A list of VPC subnet IDs. | `list(string)` | n/a | yes |
| subservice\_name | The subservice name tag of database. | `string` | n/a | yes |
| tags | A mapping of tags to assign to all resources. | `map(string)` | `{}` | no |
| time\_zone | The database time zone. | `string` | `"UTC"` | no |
| tx\_isolation | Sets the default transaction isolation level. | `string` | `"REPEATABLE-READ"` | no |
| username | Username for the master DB user. | `string` | n/a | yes |
| vpc\_id | VPC Id to associate with RDS MySQL. | `string` | n/a | yes |
| vpc\_security\_group\_ids | List of security groups | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| db\_instance\_address | The hostname of the RDS instance. See also endpoint and port. |
| db\_instance\_endpoint | .The connection endpoint in address:port format. |
| db\_instance\_id | The RDS instance ID. |
| db\_instance\_username | The master username for the database. |
| db\_option\_group\_id | The db option group name. |
| db\_parameter\_group\_id | The db parameter group name. |
| db\_subnet\_group\_id | The db subnet group name. |

