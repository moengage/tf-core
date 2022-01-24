data "aws_route53_zone" "redis_dns_hosted_zone" {
  name = var.zone_name
  vpc_id = var.vpc_id
}

resource "aws_route53_record" "redis_dns" {
  zone_id = data.aws_route53_zone.redis_dns_hosted_zone.id
  name    = var.redis_dns
  type    = "CNAME"
  ttl     = "300"
  records = var.cluster_mode_enabled ? [join("", aws_elasticache_replication_group.redis.*.configuration_endpoint_address)] : [join("", aws_elasticache_replication_group.redis.*.primary_endpoint_address)]
}
