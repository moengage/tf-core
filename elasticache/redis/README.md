## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| apply\_immediately | Specifies whether any modifications are applied immediately, or during the next maintenance window. Default is false. | `bool` | `false` | no |
| at\_rest\_encryption\_enabled | Whether to enable encryption at rest | `bool` | `true` | no |
| auth\_token | The password used to access a password protected server. Can be specified only if transit\_encryption\_enabled = true. If specified must contain from 16 to 128 alphanumeric characters or symbols | `string` | `""` | no |
| auto\_minor\_version\_upgrade | Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window | `bool` | `true` | no |
| automatic\_failover\_enabled | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. | `bool` | `true` | no |
| availability\_zones | A list of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is not important | `list(string)` | n/a | yes |
| business\_name | Business Name | `string` | n/a | yes |
| cluster\_mode\_enabled | Enable creation of a native redis cluster. | `bool` | `false` | no |
| environment | environment to deploy into, should typically dev/staging/prod | `string` | n/a | yes |
| kms\_key\_id | The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if at\_rest\_encryption\_enabled = true | `string` | `""` | no |
| notification\_topic\_arn | An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my\_sns\_topic | `string` | `""` | no |
| num\_node\_groups | Required when cluster\_mode\_enabled is set to true. Specify the number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications. | `number` | `0` | no |
| number\_cache\_clusters | Number of Redis cache clusters (nodes) to create | `number` | `0` | no |
| parameter | A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| redis\_maintenance\_window | Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period | `string` | `"fri:08:00-fri:09:00"` | no |
| redis\_node\_type | Instance type to use for creating the Redis cache clusters | `string` | n/a | yes |
| redis\_port | n/a | `number` | `6379` | no |
| redis\_snapshot\_retention\_limit | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot\_retention\_limit is not supported on cache.t1.micro or cache.t2.\* cache nodes | `number` | `0` | no |
| redis\_snapshot\_window | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period | `string` | `"06:30-07:30"` | no |
| redis\_version | Redis version to use, defaults to 5.0.6 | `string` | `"5.0.6"` | no |
| replicas\_per\_node\_group | Required when `cluster_mode_enabled` is set to true. Specify the number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource. | `number` | `0` | no |
| security\_group\_ids | A list of cache security group ids to associate with this replication group | `list(string)` | n/a | yes |
| service\_name | Service name | `string` | n/a | yes |
| snapshot\_arns | A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example: arn:aws:s3:::my\_bucket/snapshot1.rdb | `list(string)` | `[]` | no |
| snapshot\_name | The name of a snapshot from which to restore data into the new node group. Changing the snapshot\_name forces a new resource | `string` | `""` | no |
| subnets | List of VPC Subnet IDs for the cache subnet group | `list(string)` | n/a | yes |
| subservice\_name | Sub Service name | `string` | n/a | yes |
| tags | Tags for redis nodes | `map(string)` | `{}` | no |
| transit\_encryption\_enabled | Whether to enable encryption in transit. Requires 3.2.6 or >=4.0 redis\_version | `bool` | `false` | no |
| vpc\_id | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| endpoint | n/a |
| id | n/a |
| parameter\_group | n/a |
| redis\_subnet\_group\_name | n/a |

