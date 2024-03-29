locals {
  _subservice_name = coalesce(var.subservice_name, var.service_name)

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
    cost_tracking = "enabled"
  }

  _service_type        = var.service_type != "" ? format("%s-", var.service_type) : ""
  _resource_identifier = "${local._service_type}${var.business_name}-${var.service_name}"
  resource_identifier  = lower(local._resource_identifier)
}

