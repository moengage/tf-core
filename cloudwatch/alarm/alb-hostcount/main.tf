terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.44.0"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "unhealthy_host_count_percentage" {
  alarm_name          = format("%s-Uhealthy-Host-Count-Error-Rate-In-Percentage", var.alb_name)
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  datapoints_to_alarm = 5
  threshold           = var.error_rate_threshold
  alarm_description   = "This metric monitors unhealthy host count percentage"
  treat_missing_data  = "notBreaching"
  alarm_actions       = var.alarm_actions
  tags                = var.tags

  metric_query {
    id          = "e1"
    expression  = "IF(m2 > 0.4*(m1+m2), 1, 0)"
    return_data = "true"
    label       = "Unhealthy Host Count Error Rate"
  }

  metric_query {
    id = "m1"

    metric {
      metric_name = "HealthyHostCount"
      namespace   = "AWS/ELB"
      period      = var.metric_period
      stat        = "Average"
      unit        = "Count"

      dimensions = {
        LoadBalancerName = var.dimensions_loadbalancer
      }
    }
  }

  metric_query {
    id = "m2"

    metric {
      metric_name = "UnHealthyHostCount"
      namespace   = "AWS/ELB"
      period      = var.metric_period
      stat        = "Average"
      unit        = "Count"

      dimensions = {
        LoadBalancerName = var.dimensions_loadbalancer
      }
    }
  }
}
