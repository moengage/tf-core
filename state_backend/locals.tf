locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = "${lower(var.region)}"
    CreatedBy   = "${lower(var.created_by)}"
    Cluster     = "${lower(var.cluster)}"
    Environment = "${lower(var.environment)}"
    Business    = "DevOps"
  }

  resource_identifier = "${lower(var.unique_prefix)}-${lower(var.environment)}-${lower(var.region)}-${lower(var.cluster)}"
  hash_key            = "LockID"
}
