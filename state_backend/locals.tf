locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = "none"
    CreatedBy   = "${lower(var.created_by)}"
    Cluster     = "${lower(var.cluster)}"
    Environment = "${lower(var.environment)}"
  }

  resource_identifier = "${lower(var.unique_prefix)}-${lower(var.environment)}-${lower(var.cluster)}"
  hash_key            = "LockID"
}
