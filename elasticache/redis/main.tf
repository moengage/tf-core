resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = format("%.30s", "${local.resource_identifier}")
  replication_group_description = "Terraform-managed ElastiCache replication group for ${local.resource_identifier}"
  number_cache_clusters         = var.cluster_mode_enabled ? null : var.number_cache_clusters
  node_type                     = var.redis_node_type
  automatic_failover_enabled    = var.automatic_failover_enabled && var.cluster_mode_enabled ? true : false
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  availability_zones            = try(length(var.availability_zones) > 0 ? var.availability_zones : null, null)
  engine                        = "redis"
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  kms_key_id                    = var.kms_key_id
  transit_encryption_enabled    = var.transit_encryption_enabled
  auth_token                    = var.transit_encryption_enabled ? var.auth_token : null
  engine_version                = var.redis_version
  port                          = var.redis_port
  parameter_group_name          = aws_elasticache_parameter_group.redis_parameter_group.id
  subnet_group_name             = aws_elasticache_subnet_group.redis_subnet_group.id
  security_group_ids            = var.security_group_ids
  snapshot_arns                 = var.snapshot_arns
  snapshot_name                 = var.snapshot_name
  apply_immediately             = var.apply_immediately
  maintenance_window            = var.redis_maintenance_window
  notification_topic_arn        = var.notification_topic_arn
  snapshot_window               = var.redis_snapshot_window
  snapshot_retention_limit      = var.redis_snapshot_retention_limit
  tags                          = local.default_tags

  dynamic "cluster_mode" {
    for_each = var.cluster_mode_enabled ? [1] : []
    content {
      replicas_per_node_group = var.replicas_per_node_group
      num_node_groups         = var.num_node_groups
    }
  }

}

resource "aws_elasticache_parameter_group" "redis_parameter_group" {
  name        = local.resource_identifier
  description = "Terraform-managed ElastiCache parameter group for ${local.resource_identifier}"
  # Strip the patch version from redis_version var
  #family = "redis${replace(var.redis_version, "/\\.[\\d]+$/", "")}"
  family = var.redis_version == "6.2" ? "redis6.x" : "redis${replace(var.redis_version, "/\\.[\\d]+$/", "")}"

  dynamic "parameter" {
    for_each = var.cluster_mode_enabled ? concat([{ name = "cluster-enabled", value = "yes" }], var.parameter) : var.parameter
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = local.resource_identifier
  subnet_ids = var.subnets
}
