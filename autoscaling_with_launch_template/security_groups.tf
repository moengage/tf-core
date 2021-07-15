resource "aws_security_group" "instances" {
  name_prefix = "${local.resource_identifier}-instance-sg"
  vpc_id      = var.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-instance-sg"
    },
  )

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [name_prefix]
  }
}

