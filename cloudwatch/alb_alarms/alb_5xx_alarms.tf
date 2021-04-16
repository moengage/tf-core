resource "aws_cloudwatch_metric_alarm" "alb-5xx-alarm" {
  alarm_name                = format("%s-Error-Rate-In-Percentage", var.alb_name)
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  threshold                 = var.error_rate_threshold
  alarm_description         = "This metric monitors alb 5xx rate"
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
        LoadBalancer = var.dimensions_LoadBalancer
      }
    }
  }

  metric_query {
    id = "m2"

    metric {
      metric_name = "HTTPCode_ELB_5XX_Count"
      namespace   = "AWS/ApplicationELB"
      period      = "300"
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        LoadBalancer = var.dimensions_LoadBalancer
      }
    }
  }
}