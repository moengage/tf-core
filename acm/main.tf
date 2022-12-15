resource "aws_acm_certificate" "main" {
  provider = "aws.acm"
  domain_name = "${var.domain_names[0]}"
  subject_alternative_names = "${slice(var.domain_names, 1, length(var.domain_names))}"
  validation_method = "DNS"
  tags = merge(
    local.default_tags,
    map("Name", "${replace(var.domain_names[0], "*.", "star.")}"),
  )
}

resource "aws_route53_record" "validation" {
  provider = "aws.route53"
  count = "${length(var.domain_names)}"
  name = "${lookup(aws_acm_certificate.main.domain_validation_options[count.index], "resource_record_name")}"
  type = "${lookup(aws_acm_certificate.main.domain_validation_options[count.index], "resource_record_type")}"
  zone_id = "${var.zone_id != "" ? var.zone_id : lookup(var.zone_ids, element(var.domain_names, count.index), false)}"
  records = ["${lookup(aws_acm_certificate.main.domain_validation_options[count.index], "resource_record_value")}"]
  ttl = 60
}

resource "aws_acm_certificate_validation" "main" {
  provider = "aws.acm"
  certificate_arn = "${aws_acm_certificate.main.arn}"
  validation_record_fqdns = ["${aws_route53_record.validation.*.fqdn}"]
}