locals {
  asg_name = join("", aws_autoscaling_group.default.*.name)
  target   = var.dimensions_name == "QueueName" ? var.dimensions_target : local.asg_name

  default_alarms = {
    alarm_high = {
      alarm_name                = "${local.asg_name}-high"
      comparison_operator       = var.comparison_operator_high
      evaluation_periods        = var.high_evaluation_periods
      metric_name               = var.metric_name
      namespace                 = var.namespace
      period                    = var.period
      statistic                 = var.statistic
      threshold                 = var.high_threshold
      dimensions_name           = var.dimensions_name
      dimensions_target         = local.target
      alarm_description         = "Scale up Autoscaling Group ${local.asg_name},${var.dimensions_target} Greater than ${var.high_threshold} for ${var.period} * ${var.high_evaluation_periods} seconds"
      alarm_actions             = values(aws_autoscaling_policy.scale_up)[*].arn
      treat_missing_data        = var.treat_missing_data
      ok_actions                = [var.sns_topic_alarms_arn]
      insufficient_data_actions = [var.sns_topic_alarms_arn]
    },
    alarm_low = {
      alarm_name                = "${local.asg_name}-low"
      comparison_operator       = var.comparison_operator_low
      evaluation_periods        = var.low_evaluation_periods
      metric_name               = var.metric_name
      namespace                 = var.namespace
      period                    = var.period
      statistic                 = var.statistic
      threshold                 = var.low_threshold
      dimensions_name           = var.dimensions_name
      dimensions_target         = local.target
      alarm_description         = "Scale down Autoscaling Group ${local.asg_name},${var.dimensions_target} below ${var.low_threshold} for ${var.period} * ${var.low_evaluation_periods} seconds"
      alarm_actions             = values(aws_autoscaling_policy.scale_down)[*].arn
      treat_missing_data        = var.treat_missing_data
      ok_actions                = [var.sns_topic_alarms_arn]
      insufficient_data_actions = [var.sns_topic_alarms_arn]
    }
  }

  all_alarms = merge(local.default_alarms, var.custom_alarms)
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

resource "aws_autoscaling_policy" "targetandpredictive" {
  for_each = { for k, v in var.scaling_policies : k => v }

  name                   = lookup(each.value, "name", each.key)
  autoscaling_group_name = join("", aws_autoscaling_group.default.*.name)

  adjustment_type           = lookup(each.value, "adjustment_type", null)
  policy_type               = lookup(each.value, "policy_type", null)
  estimated_instance_warmup = lookup(each.value, "estimated_instance_warmup", null)
  cooldown                  = lookup(each.value, "cooldown", null)
  min_adjustment_magnitude  = lookup(each.value, "min_adjustment_magnitude", null)
  metric_aggregation_type   = lookup(each.value, "metric_aggregation_type", null)

  dynamic "target_tracking_configuration" {
    for_each = lookup(each.value, "target_tracking_configuration", null) != null ? [each.value.target_tracking_configuration] : []
    content {
      target_value     = target_tracking_configuration.value.target_value
      disable_scale_in = lookup(target_tracking_configuration.value, "disable_scale_in", null)

      dynamic "predefined_metric_specification" {
        for_each = lookup(target_tracking_configuration.value, "predefined_metric_specification", null) != null ? [target_tracking_configuration.value.predefined_metric_specification] : []
        content {
          predefined_metric_type = predefined_metric_specification.value.predefined_metric_type
        }
      }

      dynamic "customized_metric_specification" {
        for_each = lookup(target_tracking_configuration.value, "customized_metric_specification", null) != null ? [target_tracking_configuration.value.customized_metric_specification] : []
        content {

          dynamic "metric_dimension" {
            for_each = lookup(customized_metric_specification.value, "metric_dimension", null) != null ? [customized_metric_specification.value.metric_dimension] : []
            content {
              name  = lookup(metric_dimension.value, "name", null)
              value = lookup(metric_dimension.value, "value", null)
            }
          }

          metric_name = customized_metric_specification.value.metric_name
          namespace   = customized_metric_specification.value.namespace
          statistic   = customized_metric_specification.value.statistic
          unit        = lookup(customized_metric_specification.value, "unit", null)
        }
      }
    }
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  for_each = var.scaling_up_policies

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
    for_each = lookup(each.value, "step_adjustment", null) != null ? [each.value.step_adjustment] : null
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
    for_each = lookup(each.value, "step_adjustment", null) != null ? [each.value.step_adjustment] : []
    content {
      scaling_adjustment          = step_adjustment.value.scaling_adjustment
      metric_interval_lower_bound = lookup(step_adjustment.value, "metric_interval_lower_bound", null)
      metric_interval_upper_bound = lookup(step_adjustment.value, "metric_interval_upper_bound", null)
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "all_alarms" {
  for_each                  = local.all_alarms
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