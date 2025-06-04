output "parameter_group" {
  value = aws_elasticache_parameter_group.valkey_parameter_group.id
}

output "valkey_subnet_group_name" {
  value = aws_elasticache_subnet_group.valkey_subnet_group.name
}

output "id" {
  value = aws_elasticache_replication_group.valkey.id
}

output "endpoint" {
  value = aws_elasticache_replication_group.valkey.primary_endpoint_address
}

output "dns_endpoint" {
  value = aws_route53_record.valkey_dns.fqdn
}
