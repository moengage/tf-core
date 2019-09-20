resource "aws_cloudwatch_log_group" "default" {
  count             = length(var.enabled_cluster_log_types) > 0 ? 1 : 0
  name              = "/aws/eks/${local.resource_identifier}-cluster"
  retention_in_days = var.log_retention_in_days

  tags = merge(
    {
      "Name" = "aws-eks-${local.resource_identifier}-cluster"
    },
    local.default_tags,
    var.extra_tags,
  )
}

