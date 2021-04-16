resource "aws_cloudwatch_metric_alarm" "tg-5xx-alarm" {
  alarm_name                = format("%s-Error_Rate", var.tg_name)
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  threshold                 = "0.5"
  alarm_description         = "This metric monitors alb tg 5xx rate"
  alarm_actions             = var.alarm_actions
  metric_query {
    id          = "e1"
    expression  = "m2/m1*100"
    label       = "Error Rate"
    return_data = "true"
  }
  metric_query {
    id = "m1"
    metric {
      metric_name = "RequestCount"
      namespace   = "AWS/ApplicationELB"
      period      = "300"
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        LoadBalancer            = var.dimensions_LoadBalancer
        TargetGroup             = var.dimensions_TargetGroup
      }
    }
  }
  metric_query {
    id = "m2"
    metric {
      metric_name = "HTTPCode_Target_5XX_Count"
      namespace   = "AWS/ApplicationELB"
      period      = "300"
      stat        = "Sum"
      unit        = "Count"
      dimensions = {
        LoadBalancer            = var.dimensions_LoadBalancer
        TargetGroup             = var.dimensions_TargetGroup
      }
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "tg-response-time-alarm" {
  alarm_name                = format("%s-TargetResponseTime", var.tg_name)
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  threshold                 = 0.5
  alarm_description         = "This metric monitors alb tg response time"
  alarm_actions             = var.alarm_actions
  metric_name               = "TargetResponseTime"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  statistic                 = "Average"
  dimensions = {
    LoadBalancer            = var.dimensions_LoadBalancer
    TargetGroup             = var.dimensions_TargetGroup
  }
}

resource "aws_cloudwatch_metric_alarm" "tg-health-hosts-alarm" {
  alarm_name                = format("%s-HealthyHostCount", var.tg_name)
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = "1"
  threshold                 = 1
  alarm_description         = "This metric monitors alb tg healthy hosts count"
  alarm_actions             = var.alarm_actions
  metric_name               = "HealthyHostCount"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  statistic                 = "Sum"
  dimensions = {
    LoadBalancer            = var.dimensions_LoadBalancer
    TargetGroup             = var.dimensions_TargetGroup
  }
}