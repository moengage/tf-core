resource "aws_lb_target_group" "default" {
  count = var.enabled ? 1 : 0
  name = "${substr(
    local.resource_identifier,
    0,
    min(29, length(local.resource_identifier)),
  )}-tg"
  port                 = var.port
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  deregistration_delay = var.deregistration_delay
  slow_start           = var.slow_start

  stickiness {
    type            = "lb_cookie"
    cookie_duration = var.stickiness_cookie_duration
    enabled         = var.stickiness_enabled
  }

  health_check {
    enabled             = var.health_check_enabled
    interval            = var.health_check_interval
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_thresold
    unhealthy_threshold = var.health_check_unhealthy_thresold
    matcher             = var.health_check_matcher
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-alb-tg"
    },
  )
}

