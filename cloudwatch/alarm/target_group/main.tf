resource "aws_cloudwatch_metric_alarm" "tg_5xx_alarm" {
  alarm_name          = format("%s-TargetGroup-Error-Rate-In-Percentage", var.tg_name)
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  threshold           = var.tg_error_rate_threshold
  alarm_description   = "This metric monitors alb tg 5xx rate"
  alarm_actions       = var.alarm_actions
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
      period      = var.metric_period
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        LoadBalancer = var.dimensions_loadbalancer
        TargetGroup  = var.dimensions_targetgroup
      }
    }
  }
  metric_query {
    id = "m2"
    metric {
      metric_name = "HTTPCode_Target_5XX_Count"
      namespace   = "AWS/ApplicationELB"
      period      = var.metric_period
      stat        = "Sum"
      unit        = "Count"
      dimensions = {
        LoadBalancer = var.dimensions_loadbalancer
        TargetGroup  = var.dimensions_targetgroup
      }
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "tg_response_time_alarm" {
  alarm_name          = format("%s-TargetResponseTime", var.tg_name)
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  threshold           = var.tg_resp_time_threshold
  alarm_description   = "This metric monitors alb tg response time"
  alarm_actions       = var.alarm_actions
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  period              = var.metric_period
  statistic           = "Average"
  dimensions = {
    LoadBalancer = var.dimensions_loadbalancer
    TargetGroup  = var.dimensions_targetgroup
  }
}

resource "aws_cloudwatch_metric_alarm" "tg_health_hosts_alarm" {
  alarm_name          = format("%s-HealthyHostCount", var.tg_name)
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.evaluation_periods
  threshold           = var.healthy_hosts_threshold
  alarm_description   = "This metric monitors alb tg healthy hosts count"
  alarm_actions       = var.alarm_actions
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = var.metric_period
  statistic           = "Sum"
  dimensions = {
    LoadBalancer = var.dimensions_loadbalancer
    TargetGroup  = var.dimensions_targetgroup
  }
}
