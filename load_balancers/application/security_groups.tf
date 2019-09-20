resource "aws_security_group" "alb" {
  count  = var.lb_create_security_group ? 1 : 0
  name   = "${local.resource_identifier}-sg"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-sg"
    },
  )
}

