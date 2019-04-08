locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = "${lower(var.region)}"
    CreatedBy   = "${lower(var.created_by)}"
    Cluster     = "${lower(var.cluster)}"
    Environment = "${lower(var.environment)}"
  }

  vpc_name = "${lower(var.environment)}-${lower(var.cluster)}"
}
