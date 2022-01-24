data "aws_route53_zone" "rds_dns_hosted_zone" {
  name   = var.zone_name
  vpc_id = var.vpc_id
}

resource "aws_route53_record" "rds_dns" {
  zone_id = data.aws_route53_zone.rds_dns_hosted_zone.id
  name    = var.rds_dns
  type    = "CNAME"
  ttl     = "300"
  records = [aws_db_instance.default.address]
}
