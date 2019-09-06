resource "aws_security_group" "default" {
  count  = "${var.create_controlplane_security_group ? 1 : 0}"
  name   = "${local.resource_identifier}-controlplane-sg"
  vpc_id = "${var.vpc_id}"

  tags = "${merge(
    map("Name", "${local.resource_identifier}-instance-sg"),
    local.default_tags,
    var.extra_tags)
  }"
}
