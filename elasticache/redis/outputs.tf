output "parameter_group" {
  value = aws_elasticache_parameter_group.redis_parameter_group.id
}

output "redis_subnet_group_name" {
  value = aws_elasticache_subnet_group.redis_subnet_group.name
}

output "id" {
  value = aws_elasticache_replication_group.redis.id
}

output "endpoint" {
  value = aws_elasticache_replication_group.redis.primary_endpoint_address
}

output "dns_endpoint" {
  value = aws_route53_record.redis_dns.fqdn
}
