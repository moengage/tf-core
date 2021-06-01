resource "aws_autoscaling_policy" "cpu_based_asg_scaling_policy" {
  count                     = var.create_cpu_based_asg_scaling_policy ? 1 : 0
  name                      = format("%s-asg-cpu-util-target-tracking-scaling-policy", var.asg_name)
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = var.estimated_instance_warmup
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.asg_avg_cpu_utilization_threshold
  }
  autoscaling_group_name = var.asg_name
}


resource "aws_autoscaling_policy" "alb_tg_rpm_based_asg_scaling_policy" {
  count                     = var.create_alb_tg_rpm_based_asg_scaling_policy ? 1 : 0
  name                      = format("%s-asg-alb-tg-req-count-target-tracking-scaling-policy", var.asg_name)
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = var.estimated_instance_warmup
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label         = var.alb_tg_suffix
    }
    target_value = var.alb_tg_request_count_threshold
  }
  autoscaling_group_name = var.asg_name
}

resource "aws_autoscaling_policy" "sqs_msgs_alarm_based_asg_scale_in_policy" {
  count                  = var.create_sqs_msgs_alarm_based_asg_scale_in_policy ? 1 : 0
  name                   = format("%s-asg-sqs-alarm-simple-scale-in-policy", var.asg_name)
  scaling_adjustment     = -var.scale_in_adjustment_count
  adjustment_type        = "ChangeInCapacity"
  cooldown               = var.scale_in_cooldown_seconds
  autoscaling_group_name = var.asg_name
}

resource "aws_cloudwatch_metric_alarm" "sqs_msgs_low_alarm" {
  count               = var.create_sqs_msgs_alarm_based_asg_scale_in_policy ? 1 : 0
  alarm_name          = format("%s-Low-ApproximateNumberOfMessagesVisible", var.sqs_queue_name)
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.sqs_msgs_low_alarm_evaluation_periods
  threshold           = var.sqs_msgs_low_alarm_threshold
  alarm_description   = "This metric monitors sqs approx number of messages visible"
  alarm_actions       = [aws_autoscaling_policy.sqs_msgs_alarm_based_asg_scale_in_policy[0].arn]
  datapoints_to_alarm = var.sqs_msgs_low_alarm_datapoints_to_alarm
  metric_name         = "ApproximateNumberOfMessagesVisible"
  namespace           = "AWS/SQS"
  period              = var.sqs_msgs_low_alarm_periods
  statistic           = "Average"
  dimensions = {
    QueueName = var.sqs_queue_name
  }
}


resource "aws_autoscaling_policy" "sqs_msgs_alarm_based_asg_scale_out_policy" {
  count                  = var.create_sqs_msgs_alarm_based_asg_scale_out_policy ? 1 : 0
  name                   = format("%s-asg-sqs-alarm-simple-scale-out-policy", var.asg_name)
  scaling_adjustment     = var.scale_out_adjustment_count
  adjustment_type        = "ChangeInCapacity"
  cooldown               = var.scale_out_cooldown_seconds
  autoscaling_group_name = var.asg_name
}

resource "aws_cloudwatch_metric_alarm" "sqs_msgs_high_alarm" {
  count               = var.create_sqs_msgs_alarm_based_asg_scale_out_policy ? 1 : 0
  alarm_name          = format("%s-High-ApproximateNumberOfMessagesVisible", var.sqs_queue_name)
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.sqs_msgs_high_alarm_evaluation_periods
  threshold           = var.sqs_msgs_high_alarm_threshold
  alarm_description   = "This metric monitors sqs approx number of messages visible"
  alarm_actions       = [aws_autoscaling_policy.sqs_msgs_alarm_based_asg_scale_out_policy[0].arn]
  datapoints_to_alarm = var.sqs_msgs_high_alarm_datapoints_to_alarm
  metric_name         = "ApproximateNumberOfMessagesVisible"
  namespace           = "AWS/SQS"
  period              = var.sqs_msgs_high_alarm_periods
  statistic           = "Average"
  dimensions = {
    QueueName = var.sqs_queue_name
  }
}
