locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = "${lower(var.region)}"
    CreatedBy   = "${lower(var.created_by)}"
    Cluster     = "${lower(var.cluster)}"
    Environment = "${lower(var.environment)}"
    Team        = "${lower(var.team)}"
  }

  resource_identifier         = "${lower(var.environment)}-${lower(var.cluster)}"
  _iam_resource_identifier    = "${lower(local.resource_identifier)}/${data.aws_region.current.name}"
  iam_resource_identifier     = "${replace(local._iam_resource_identifier, "/", "-")}"
  iam_resource_path           = "/${local._iam_resource_identifier}/"
  controlplane_security_group = "${coalesce(join("", aws_security_group.cluster.*.id), join(",", var.security_group_ids))}"
}
