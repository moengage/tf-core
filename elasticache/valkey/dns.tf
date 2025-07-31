data "aws_route53_zone" "valkey_dns_hosted_zone" {
  name = var.zone_name
  vpc_id = var.vpc_id
}

resource "aws_route53_record" "valkey_dns" {
  zone_id = data.aws_route53_zone.valkey_dns_hosted_zone.id
  name    = var.valkey_dns
  type    = "CNAME"
  ttl     = "300"
  records = var.cluster_mode_enabled ? [join("", aws_elasticache_replication_group.valkey.*.configuration_endpoint_address)] : [join("", aws_elasticache_replication_group.valkey.*.primary_endpoint_address)]
}
