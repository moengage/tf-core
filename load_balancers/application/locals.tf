locals {
  _subservice_name = coalesce(var.subservice_name, var.service_name)

  default_tags = {
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
    CreatedBy   = lower(var.created_by)
    Cluster     = lower(var.cluster)
    Environment = lower(var.environment)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
    SubService  = lower(local._subservice_name)
  }

  _resource_identifier = "${var.environment}-${var.business_name}-${var.service_name}"
  resource_identifier  = lower(local._resource_identifier)

  logs_bucket_name = "${local.resource_identifier}-alb-logs-${data.aws_region.current.name}"

  lb_security_groups = split(
    ",",
    var.lb_create_security_group ? join(
      ",",
      concat(compact(aws_security_group.alb.*.id), var.lb_security_groups),
    ) : join(",", var.lb_security_groups),
  )
}
