resource "aws_route53_zone" "moeinternal_com" {
  name = "moeinternal.com"
  comment = lower(var.region)
  vpc {
    vpc_id = aws_vpc.default.id
  }
  lifecycle {
    ignore_changes = [vpc]
  }
}

resource "aws_route53_zone" "moengage_com" {
  name = "moengage.com"
  comment = lower(var.region)
  vpc {
    vpc_id = aws_vpc.default.id
  }
  lifecycle {
    ignore_changes = [vpc]
  }
}
