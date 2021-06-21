## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_all\_egress | Add an allow all egress rule to the SG | `bool` | `true` | no |
| business\_name | business\_name tag | `any` | n/a | yes |
| environment | Environment | `any` | n/a | yes |
| ingress\_rules | List of ingress rules to create | `list(map(string))` | `[]` | no |
| service\_name | service\_name | `any` | n/a | yes |
| sg\_description | The security group description | `any` | n/a | yes |
| subservice\_name | subservice\_name | `any` | n/a | yes |
| vpc\_id | VPC ID | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
| name | n/a |
| owner\_id | n/a |
| vpc\_id | n/a |

