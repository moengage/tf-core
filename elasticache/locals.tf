locals {
  _subservice_name     = coalesce(var.subservice_name, var.service_name)
  _resource_identifier = "${var.business_name}-${var.service_name}-${local._subservice_name}"
  resource_identifier  = lower(local._resource_identifier)

  default_tags = {
    ManagedBy   = "terraform"
    CreatedBy   = lower(var.created_by)
    Environment = lower(var.environment)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
    SubService  = lower(local._subservice_name)
    Name        = lower(local.resource_identifier)
  }
}

