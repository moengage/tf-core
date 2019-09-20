locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
    CreatedBy   = lower(var.created_by)
    Cluster     = lower(var.cluster)
    Environment = lower(var.environment)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
    FabTag      = var.fab_tag
  }

  _service_type        = var.service_type != "" ? format("%s-", var.service_type) : ""
  _resource_identifier = "${local._service_type}${var.business_name}-${var.service_name}"
  resource_identifier  = lower(local._resource_identifier)

  iam_resource_identifier = "${lower(local._resource_identifier)}-${data.aws_region.current.name}"
  iam_resource_path       = "/${replace(local.iam_resource_identifier, "-", "/")}/"

  asg_tags = [
    {
      "key"                 = "Business"
      "value"               = lower(var.business_name)
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "Service"
      "value"               = lower(var.service_name)
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "Environment"
      "value"               = lower(var.environment)
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "FabTag"
      "value"               = var.fab_tag
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "Cluster"
      "value"               = lower(var.cluster)
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "ManagedBy"
      "value"               = "terraform"
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "Name"
      "value"               = local.resource_identifier
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "CreatedBy"
      "value"               = var.created_by
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
  ]

  asg_managed_name_tag = {
    Name = local.resource_identifier
  }
}

