locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
    CreatedBy   = lower(var.created_by)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
    SubService  = lower(var.subservice_name)
  }

  _resource_identifier = "${var.business_name}-${var.service_name}-${var.subservice_name}"
  resource_identifier  = lower(local._resource_identifier)
}
