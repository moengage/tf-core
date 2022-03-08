resource "aws_security_group" "default" {
  name        = var.sg_name != "" ? var.sg_name : local.resource_identifier
  vpc_id      = var.vpc_id
  description = var.sg_description
  tags        = local.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "all_egress" {
  type              = "egress"
  count             = var.allow_all_egress ? 1 : 0
  security_group_id = aws_security_group.default.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}

resource "aws_security_group_rule" "ingress_rules" {
  for_each = local.keyed_rules

  security_group_id = aws_security_group.default.id

  type        = each.value.type
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  protocol    = each.value.protocol
  description = each.value.description

  cidr_blocks              = length(each.value.cidr_blocks) == 0 ? null : each.value.cidr_blocks
  ipv6_cidr_blocks         = length(each.value.ipv6_cidr_blocks) == 0 ? null : each.value.ipv6_cidr_blocks
  prefix_list_ids          = length(each.value.prefix_list_ids) == 0 ? [] : each.value.prefix_list_ids
  self                     = each.value.self
  source_security_group_id = each.value.source_security_group_id

  lifecycle {
    create_before_destroy = true
  }
}
