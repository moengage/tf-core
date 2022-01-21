data "aws_route53_zone" "redis_dns_hosted_zone" {
  name = var.zone_name
}

resource "aws_route53_record" "redis_dns" {
  zone_id = data.aws_route53_zone.redis_dns_hosted_zone.id
  name    = var.redis_dns
  type    = "CNAME"
  ttl     = "300"
  records = [aws_elasticache_replication_group.redis.primary_endpoint_address]
}
