locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
    CreatedBy   = lower(var.created_by)
    Cluster     = lower(var.cluster)
    Environment = lower(var.environment)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
  }

  _resource_identifier = "${var.environment}-${var.business_name}-${var.service_name}"
  resource_identifier  = lower(local._resource_identifier)
}

