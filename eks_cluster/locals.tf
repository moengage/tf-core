locals {
  resource_identifier      = "${lower(var.environment)}-${lower(var.cluster)}"
  _iam_resource_identifier = "${lower(local.resource_identifier)}/${data.aws_region.current.name}"
  iam_resource_identifier  = replace(local._iam_resource_identifier, "/", "-")
  iam_resource_path        = "/${local._iam_resource_identifier}/"
  controlplane_security_group = list(coalesce(
    join("", aws_security_group.default.*.id),
    join(",", var.security_group_ids),
  ))

  _subservice_name = coalesce(var.subservice_name, var.service_name)

  default_tags = {
    ManagedBy   = "terraform"
    Region      = lower(var.region)
    CreatedBy   = lower(var.created_by)
    Cluster     = lower(var.cluster)
    Environment = lower(var.environment)
    Team        = lower(var.team)
    Business    = var.business
    Service     = lower(var.service_name)
    SubService  = lower(local._subservice_name)
  }
}

