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
  }

  _resource_identifier = "${var.business_name}-${var.service_name}-${local._subservice_name}"
  resource_identifier  = replace(lower(local._resource_identifier), "_", "-")
}

