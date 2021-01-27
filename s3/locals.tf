locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = lower(var.region)
    CreatedBy   = lower(var.created_by)
    Cluster     = lower(var.cluster)
    Environment = lower(var.environment)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
    SubService  = lower(var.subservice_name)
    Team        = lower(var.team_name)
  }

  resource_identifier = "${lower(var.unique_prefix)}-${lower(var.bucket_name)}"
}

