resource "aws_lb" "default" {
  name = var.lb_name != "" ? var.lb_name : "${substr(
    local.resource_identifier,
    0,
    min(28, length(local.resource_identifier)),
  )}-alb"
  load_balancer_type = "application"
  internal           = var.lb_is_internal
  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  security_groups                  = local.lb_security_groups
  subnets                          = var.lb_subnets
  idle_timeout                     = var.lb_idle_timeout
  enable_deletion_protection       = var.lb_enable_deletion_protection
  enable_cross_zone_load_balancing = var.lb_enable_cross_zone_load_balancing
  enable_http2                     = var.lb_enable_http2
  ip_address_type                  = var.lb_ip_address_type

  access_logs {
    bucket  = try(element(compact([var.access_log_bucket_id, aws_s3_bucket.logs[0].id]), 0), "")
    enabled = var.lb_access_logs_enabled
  }

  timeouts {
    create = var.lb_create_timeout
    update = var.lb_update_timeout
    delete = var.lb_delete_timeout
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = local.resource_identifier
    },
  )
}

resource "aws_lb_target_group" "default" {
  name = var.tg_name != "" ? var.tg_name : "${substr(
    local.resource_identifier,
    0,
    min(25, length(local.resource_identifier)),
  )}-def-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = var.lb_health_check_interval
    path                = var.lb_health_check_path
    port                = var.lb_health_check_port
    protocol            = var.lb_health_check_protocol
    timeout             = var.lb_health_check_timeout
    healthy_threshold   = var.lb_health_check_healthy_thresold
    unhealthy_threshold = var.lb_health_check_unhealthy_thresold
    matcher             = var.lb_health_check_matcher_status_code
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-def-tg"
    },
  )
}

resource "aws_lb_listener" "https" {
  count             = var.lb_enable_https_listener ? 1 : 0
  load_balancer_arn = aws_lb.default.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = var.lb_https_listener_ssl_policy
  certificate_arn   = var.lb_certificate_arn

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "forward"
  }
}

resource "aws_lb_listener" "http" {
  count             = var.lb_enable_http_listener ? 1 : 0
  load_balancer_arn = aws_lb.default.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "forward"
  }
}

module "alb_default_alarm" {
  count                   = var.create_default_alarms ? 1 : 0
  source                  = "git@github.com:moengage/tf-core.git//cloudwatch/alarm/application_lb?ref=master"
  alb_name                = aws_lb.default.name
  error_rate_threshold    = var.error_rate_threshold
  evaluation_periods      = var.evaluation_periods
  alarm_actions           = var.alarm_actions
  metric_period           = var.metric_period
  dimensions_loadbalancer = aws_lb.default.arn_suffix
}
