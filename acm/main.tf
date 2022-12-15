resource "aws_acm_certificate" "main" {
  domain_name = "${var.domain_names[0]}"
  subject_alternative_names = "${slice(var.domain_names, 1, length(var.domain_names))}"
  validation_method = "DNS"
  tags = merge(
    local.default_tags,
    map("Name", "${replace(var.domain_names[0], "*.", "star.")}"),
  )
}

resource "aws_route53_record" "validation" {
  count = "${length(var.domain_names)}"
  name = "${lookup(tolist(aws_acm_certificate.main.domain_validation_options)[count.index], "resource_record_name")}"
  type = "${lookup(tolist(aws_acm_certificate.main.domain_validation_options)[count.index], "resource_record_type")}"
  zone_id = "${var.zone_id != "" ? var.zone_id : lookup(var.zone_ids, element(var.domain_names, count.index), false)}"
  records = ["${lookup(tolist(aws_acm_certificate.main.domain_validation_options)[count.index], "resource_record_value")}"]
  ttl = 60
}

resource "aws_acm_certificate_validation" "main" {
  certificate_arn = "${aws_acm_certificate.main.arn}"
  validation_record_fqdns = ["${aws_route53_record.validation.*.fqdn}"]
}