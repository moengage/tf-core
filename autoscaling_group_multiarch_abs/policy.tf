locals {
  asg_name            = join("", aws_autoscaling_group.default.*.name)
  autoscaling_enabled = var.autoscaling_policies_enabled

  default_alarms = {
    alarm_high = {
      alarm_name                = "${local.asg_name}-${var.arch_type}-high"
      comparison_operator       = var.comparison_operator_high
      evaluation_periods        = var.high_evaluation_periods
      metric_name               = var.metric_name
      namespace                 = var.namespace
      period                    = var.high_period
      statistic                 = var.statistic
      threshold                 = var.high_threshold
      dimensions_name           = var.dimensions_name
      dimensions_target         = var.dimensions_target
      alarm_description         = "Scale up Autoscaling Group ${local.asg_name} Arch type ${var.arch_type},${var.dimensions_target} Greater than ${var.high_threshold} for ${var.high_period} * ${var.high_evaluation_periods} seconds"
      alarm_actions             = values(aws_autoscaling_policy.scale_up)[*].arn
      treat_missing_data        = var.treat_missing_data
      ok_actions                = [var.sns_topic_alarms_arn]
      insufficient_data_actions = [var.sns_topic_alarms_arn]
    },
    alarm_low = {
      alarm_name                = "${local.asg_name}-${var.arch_type}-low"
      comparison_operator       = var.comparison_operator_low
      evaluation_periods        = var.low_evaluation_periods
      metric_name               = var.metric_name
      namespace                 = var.namespace
      period                    = var.low_period
      statistic                 = var.statistic
      threshold                 = var.low_threshold
      dimensions_name           = var.dimensions_name
      dimensions_target         = var.dimensions_target
      alarm_description         = "Scale down Autoscaling Group ${local.asg_name} Arch type ${var.arch_type},${var.dimensions_target} below ${var.low_threshold} for ${var.low_period} * ${var.low_evaluation_periods} seconds"
      alarm_actions             = values(aws_autoscaling_policy.scale_down)[*].arn
      treat_missing_data        = var.treat_missing_data
      ok_actions                = [var.sns_topic_alarms_arn]
      insufficient_data_actions = [var.sns_topic_alarms_arn]
    }
  }
}

resource "aws_autoscaling_schedule" "schedulers" {
  for_each = var.create_schedule ? var.schedules : {}

  scheduled_action_name  = each.key
  autoscaling_group_name = join("", aws_autoscaling_group.default.*.name)

  min_size         = lookup(each.value, "min_size", null)
  max_size         = lookup(each.value, "max_size", null)
  desired_capacity = lookup(each.value, "desired_capacity", null)
  start_time       = lookup(each.value, "start_time", null)
  end_time         = lookup(each.value, "end_time", null)
  time_zone        = lookup(each.value, "time_zone", null)

  recurrence = lookup(each.value, "recurrence", null)
}

resource "aws_autoscaling_policy" "target_tracking" {
  count = var.enable_target_tracking ? 1 : 0

  name                      = "${local.asg_name}-target-tracking-${var.target_value}"
  autoscaling_group_name    = join("", aws_autoscaling_group.default.*.name)
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = var.estimated_instance_warmup

  target_tracking_configuration {
    target_value     = var.target_value
    disable_scale_in = var.disable_scale_in

    predefined_metric_specification {
      predefined_metric_type = var.predefined_metric_type
    }
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  for_each = { for k, v in var.scaling_up_policies : k => v }

  name                      = lookup(each.value, "name", each.key)
  autoscaling_group_name    = join("", aws_autoscaling_group.default.*.name)
  adjustment_type           = lookup(each.value, "adjustment_type", null)
  policy_type               = lookup(each.value, "policy_type", null)
  estimated_instance_warmup = lookup(each.value, "estimated_instance_warmup", null)
  cooldown                  = lookup(each.value, "cooldown", null)
  min_adjustment_magnitude  = lookup(each.value, "min_adjustment_magnitude", null)
  metric_aggregation_type   = lookup(each.value, "metric_aggregation_type", null)
  scaling_adjustment        = lookup(each.value, "scaling_adjustment", null)

  dynamic "step_adjustment" {
    for_each = lookup(each.value, "step_adjustment", null) != null ? [each.value.step_adjustment][0] : []
    content {
      scaling_adjustment          = step_adjustment.value.scaling_adjustment
      metric_interval_lower_bound = lookup(step_adjustment.value, "metric_interval_lower_bound", null)
      metric_interval_upper_bound = lookup(step_adjustment.value, "metric_interval_upper_bound", null)
    }
  }
}

resource "aws_autoscaling_policy" "scale_down" {
  for_each = { for k, v in var.scaling_down_policies : k => v }

  name                      = lookup(each.value, "name", each.key)
  autoscaling_group_name    = join("", aws_autoscaling_group.default.*.name)
  adjustment_type           = lookup(each.value, "adjustment_type", null)
  policy_type               = lookup(each.value, "policy_type", null)
  estimated_instance_warmup = lookup(each.value, "estimated_instance_warmup", null)
  cooldown                  = lookup(each.value, "cooldown", null)
  min_adjustment_magnitude  = lookup(each.value, "min_adjustment_magnitude", null)
  metric_aggregation_type   = lookup(each.value, "metric_aggregation_type", null)
  scaling_adjustment        = lookup(each.value, "scaling_adjustment", null)

  dynamic "step_adjustment" {
    for_each = lookup(each.value, "step_adjustment", null) != null ? [each.value.step_adjustment][0] : []
    content {
      scaling_adjustment          = step_adjustment.value.scaling_adjustment
      metric_interval_lower_bound = lookup(step_adjustment.value, "metric_interval_lower_bound", null)
      metric_interval_upper_bound = lookup(step_adjustment.value, "metric_interval_upper_bound", null)
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "all_alarms" {
  for_each                  = local.autoscaling_enabled ? local.default_alarms : {}
  alarm_name                = format("%s", each.value.alarm_name)
  comparison_operator       = each.value.comparison_operator
  evaluation_periods        = each.value.evaluation_periods
  metric_name               = each.value.metric_name
  namespace                 = each.value.namespace
  period                    = each.value.period
  statistic                 = each.value.statistic
  threshold                 = each.value.threshold
  treat_missing_data        = each.value.treat_missing_data
  ok_actions                = each.value.ok_actions
  insufficient_data_actions = each.value.insufficient_data_actions
  dimensions = {
    (each.value.dimensions_name) = (each.value.dimensions_target)
  }

  alarm_description = each.value.alarm_description
  alarm_actions     = each.value.alarm_actions
  tags = {
    Business   = lower(var.business_name)
    Service    = lower(var.service_name)
    SubService = lower(var.environment)
    FabTag     = lower(var.fab_tag)
    ManagedBy  = "terraform"
    CreatedBy  = lower(var.created_by)
  }
}