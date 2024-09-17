resource "aws_cloudwatch_event_rule" "asg_refresh_rule" {
  for_each = { for obj in var.asg_name_with_expression : obj.asg_name => obj }

  name        = "instance-refresh-${each.value.asg_name}"
  description = "ASG Instace refresh rule, Managed via Terraform"

  schedule_expression = each.value.expression
  tags = merge(
    local.default_tags
  )
}

