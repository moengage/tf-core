resource "aws_cloudwatch_metric_alarm" "alb_5xx_alarm" {
  alarm_name          = format("%s-Error-Rate-In-Percentage", var.alb_name)
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  threshold           = var.error_rate_threshold
  alarm_description   = "This metric monitors alb 5xx rate"
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
      }
    }
  }

  metric_query {
    id = "m2"

    metric {
      metric_name = "HTTPCode_ELB_5XX_Count"
      namespace   = "AWS/ApplicationELB"
      period      = var.metric_period
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        LoadBalancer = var.dimensions_loadbalancer
      }
    }
  }
}
