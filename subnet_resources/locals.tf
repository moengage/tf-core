locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = "${lower(var.region)}"
    CreatedBy   = "${lower(var.created_by)}"
    Cluster     = "${lower(var.cluster)}"
    Environment = "${lower(var.environment)}"
    Business    = "${lower(var.business_name)}"
  }

  resource_identifier = "${lower(var.business_name)}"
}
