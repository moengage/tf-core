resource "aws_elasticache_replication_group" "valkey" {
  replication_group_id          = format("%.30s", "${local.resource_identifier}")
  num_cache_clusters         = var.cluster_mode_enabled ? null : var.number_cache_clusters
  node_type                     = var.valkey_node_type
  automatic_failover_enabled    = var.automatic_failover_enabled && var.cluster_mode_enabled ? true : false
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  preferred_cache_cluster_azs   = var.availability_zones
  description                   = "Terraform-managed ElastiCache replication group for ${local.resource_identifier}"
  engine                        = "valkey"
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  kms_key_id                    = var.kms_key_id
  transit_encryption_enabled    = var.transit_encryption_enabled
  auth_token                    = var.transit_encryption_enabled ? var.auth_token : null
  engine_version                = var.valkey_version
  port                          = var.valkey_port
  parameter_group_name          = aws_elasticache_parameter_group.valkey_parameter_group.id
  subnet_group_name             = aws_elasticache_subnet_group.valkey_subnet_group.id
  security_group_ids            = var.security_group_ids
  snapshot_arns                 = var.snapshot_arns
  snapshot_name                 = var.snapshot_name
  apply_immediately             = var.apply_immediately
  maintenance_window            = var.valkey_maintenance_window
  notification_topic_arn        = var.notification_topic_arn
  snapshot_window               = var.valkey_snapshot_window
  snapshot_retention_limit      = var.valkey_snapshot_retention_limit
  tags                          = local.default_tags
  cluster_mode_enabled         = var.cluster_mode_enabled

}

resource "aws_elasticache_parameter_group" "valkey_parameter_group" {
  name        = local.resource_identifier
  description = "Terraform-managed ElastiCache parameter group for ${local.resource_identifier}"
  # Strip the patch version from valkey_version var
  family = "valkey${replace(var.valkey_version, "/\\.[\\d]+$/", "")}"

  dynamic "parameter" {
    for_each = var.cluster_mode_enabled ? concat([{ name = "cluster-enabled", value = "yes" }], var.parameter) : var.parameter
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}

resource "aws_elasticache_subnet_group" "valkey_subnet_group" {
  name       = local.resource_identifier
  subnet_ids = var.subnets
}
