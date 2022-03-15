output "id" {
  value = aws_lb.default.id
}

output "security_group" {
  value = join("", aws_security_group.alb.*.id)
}

output "arn" {
  value = aws_lb.default.arn
}

output "arn_suffix" {
  value = aws_lb.default.arn_suffix
}

output "dns_name" {
  value = aws_lb.default.dns_name
}

output "zone_id" {
  value = aws_lb.default.zone_id
}

output "https_listener_arn" {
  value = join("", aws_lb_listener.https.*.arn)
}

output "http_listener_arn" {
  value = join("", aws_lb_listener.http.*.arn)
}

output "target_group_arn" {
  value = aws_lb_target_group.default.arn
}

output "route_53_dns_names" {
  value = values(aws_route53_record.dns)[*].fqdn
}
