# If major_engine_version is unspecified, then calculate major_engine_version.
# Calculate from X.Y.Z(or X.Y) to X.Y, for example 5.7.21 is calculated 5.7.
locals {
  version_elements       = split(".", var.engine_version)
  major_version_elements = [local.version_elements[0], local.version_elements[1]]
  major_engine_version   = var.major_engine_version == "" ? join(".", local.major_version_elements) : var.major_engine_version
  family                 = "mysql${local.major_engine_version}"
  _subservice_name       = coalesce(var.subservice_name, var.service_name)
  _resource_identifier   = "${var.business_name}-${var.service_name}-${local._subservice_name}"
  resource_identifier    = lower(local._resource_identifier)

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


