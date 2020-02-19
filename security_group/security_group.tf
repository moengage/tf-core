resource "aws_security_group" "base_sg" {
  name        = local.resource_identifier
  vpc_id      = var.vpc_id
  description = var.sg_description
  tags        = local.default_tags

  lifecycle {
    create_before_destroy = var.create_before_destroy
  }
}

resource "aws_security_group_rule" "all_egress" {
  type              = "egress"
  count             = var.allow_all_egress ? 1 : 0
  security_group_id = aws_security_group.base_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}
