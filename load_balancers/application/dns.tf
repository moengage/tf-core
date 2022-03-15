resource "aws_route53_record" "dns" {
  for_each = var.dns_names != "" ? var.dns_names : {}
  zone_id  = each.value.zone_id
  name     = each.value.dns_name
  type     = "CNAME"
  ttl      = "300"
  records  = [aws_lb.default.dns_name]
}
