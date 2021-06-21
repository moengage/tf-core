resource "aws_security_group" "default" {
  name        = local.resource_identifier
  vpc_id      = var.vpc_id
  description = var.sg_description
  tags        = local.default_tags

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
  count                    = length(var.ingress_rules)
  security_group_id        = aws_security_group.default.id
  type                     = "ingress"
  description              = var.ingress_rules[count.index]["description"]
  from_port                = var.ingress_rules[count.index]["from_port"]
  to_port                  = var.ingress_rules[count.index]["to_port"]
  protocol                 = var.ingress_rules[count.index]["protocol"]
  self                     = lookup(var.ingress_rules[count.index], "self", null)
  source_security_group_id = lookup(var.ingress_rules[count.index], "source_security_group_id", null)
}
