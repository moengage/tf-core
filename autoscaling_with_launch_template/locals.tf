locals {
  iam_resource_identifier = "${lower(local._resource_identifier)}-${data.aws_region.current.name}"
  iam_resource_path       = "/${replace(local.iam_resource_identifier, "-", "/")}/"

  _subservice_name = coalesce(var.subservice_name, var.service_name)

  _resource_identifier = "${var.environment}-${var.business_name}-${var.service_name}-${local._subservice_name}"
  resource_identifier  = lower(local._resource_identifier)

  default_tags = {
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
    CreatedBy   = lower(var.created_by)
    Cluster     = lower(var.cluster)
    Environment = lower(var.environment)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
    SubService  = lower(local._subservice_name)
    FabTag      = var.fab_tag
  }

  _asg_tags = [
    {
      "key"                 = "Business"
      "value"               = lower(var.business_name)
      "propagate_at_launch" = false
    },
    {
      "key"                 = "Service"
      "value"               = lower(var.service_name)
      "propagate_at_launch" = false
    },
    {
      "key"                 = "SubService"
      "value"               = lower(local._subservice_name)
      "propagate_at_launch" = false
    },
    {
      "key"                 = "Environment"
      "value"               = lower(var.environment)
      "propagate_at_launch" = false
    },
    {
      "key"                 = "FabTag"
      "value"               = var.fab_tag
      "propagate_at_launch" = false
    },
    {
      "key"                 = "Cluster"
      "value"               = lower(var.cluster)
      "propagate_at_launch" = false
    },
    {
      "key"                 = "ManagedBy"
      "value"               = "terraform"
      "propagate_at_launch" = false
    },
    {
      "key"                 = "Name"
      "value"               = coalesce(var.alternate_resource_name, local.resource_identifier)
      "propagate_at_launch" = false
    },
    {
      "key"                 = "CreatedBy"
      "value"               = var.created_by
      "propagate_at_launch" = false
    },
    {
      "key"                 = "cost_tracking"
      "value"               = "enabled"
      "propagate_at_launch" = true
    },
  ]

  asg_tags = concat(local._asg_tags, var.extra_asg_tags)

  asg_managed_name_tag = {
    Name = coalesce(var.alternate_resource_name, local.resource_identifier)
  }
}

