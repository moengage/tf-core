locals {
  resource_identifier = lower("${var.cluster}-${var.resource_group}-${var.resource_type}-sg")

  default_tags = {
    ManagedBy     = "terraform"
    Region        = lower(data.aws_region.current.name)
    CreatedBy     = lower(var.created_by)
    Cluster       = lower(var.cluster)
    Environment   = lower(var.environment)
    Name          = local.resource_identifier
    ResourceType  = lower(var.resource_type)
    ResourceGroup = lower(var.resource_group)
  }
}
