locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = lower(var.region)
    CreatedBy   = lower(var.created_by)
    Cluster     = lower(var.cluster)
    Environment = lower(var.environment)
    Business    = "sre"
    Service     = "vpc-module"
    SubService  = "vpc-module"
  }

  resource_identifier = "${lower(var.environment)}-${lower(var.cluster)}"
}
