## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allocated\_storage | Storage allocated to database instance | `number` | `32` | no |
| auto\_minor\_version\_upgrade | Minor engine upgrades are applied automatically to the DB instance during the maintenance window | `bool` | `false` | no |
| backup\_retention\_period | Number of days to keep database backups | `number` | `30` | no |
| backup\_window | 30 minute time window to reserve for backups | `string` | `"04:00-04:30"` | no |
| business\_name | Business Name | `string` | n/a | yes |
| copy\_tags\_to\_snapshot | Flag to enable or disable copying instance tags to the final snapshot | `bool` | `true` | no |
| database\_name | Name of database inside storage engine | `string` | n/a | yes |
| database\_password | Database password inside storage engine | `string` | n/a | yes |
| database\_port | Port on which database will accept connections | `number` | `5432` | no |
| database\_username | Name of user inside storage engine | `string` | n/a | yes |
| deletion\_protection | Flag to protect the database instance from deletion | `bool` | `false` | no |
| engine\_version | Database engine version | `string` | `"11.5"` | no |
| environment | Name of environment - staging/prod | `string` | n/a | yes |
| extra\_tags | extra tags | `map(any)` | `"Database subnet group"` | no |
| instance\_type | Instance type for database instance | `string` | `"db.t3.micro"` | no |
| iops | The amount of provisioned IOPS | `number` | `0` | no |
| maintenance\_window | 60 minute time window to reserve for maintenance | `string` | `"sun:04:30-sun:05:30"` | no |
| monitoring\_interval | The interval, in seconds, between points when Enhanced Monitoring metrics are collected | `number` | `0` | no |
| multi\_availability\_zone | Flag to enable hot standby in another availability zone | `bool` | `false` | no |
| parameter\_group | Database engine parameter group | `string` | `"default-postgres12"` | no |
| security\_group\_ids | A list of cache security group ids to associate with this replication group | `list(string)` | n/a | yes |
| service\_name | Service name | `string` | n/a | yes |
| skip\_final\_snapshot | Flag to enable or disable a snapshot if the database instance is terminated | `bool` | `true` | no |
| storage\_encrypted | Flag to enable storage encryption | `bool` | `true` | no |
| storage\_type | Type of underlying storage for database | `string` | `"gp2"` | no |
| subnet\_group\_description | Database subnet group | `string` | `"Database subnet group"` | no |
| subnet\_ids | A list of VPC subnet IDs. | `list(string)` | n/a | yes |
| subservice\_name | Sub Service name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The database instance ID |

