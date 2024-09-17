locals {
  default_tags = {
    ManagedBy   = "terraform"
    CreatedBy   = lower(var.created_by)
    Cluster     = lower(var.cluster)
    Environment = lower(var.environment)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
    SubService  = lower(var.subservice_name)
  }
}
