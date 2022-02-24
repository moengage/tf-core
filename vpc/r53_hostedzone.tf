resource "aws_route53_zone" "private_hosted_zone" {
  count   = length(var.route53_zone_list)
  name    = var.route53_zone_list[count.index]
  comment = lower(var.region)
  vpc {
    vpc_id = aws_vpc.default.id
  }
  lifecycle {
    ignore_changes = [vpc]
  }
}
