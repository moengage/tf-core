data "aws_caller_identity" "current" {}

resource "aws_db_subnet_group" "default" {
  name        = local.resource_identifier
  subnet_ids  = var.subnet_ids
  description = var.subnet_group_description
  tags        = local.default_tags
}

resource "aws_db_instance" "postgresql" {
  allocated_storage          = var.allocated_storage
  engine                     = "postgres"
  engine_version             = var.engine_version
  identifier                 = local.resource_identifier
  snapshot_identifier        = var.snapshot_identifier
  instance_class             = var.instance_type
  storage_type               = var.storage_type
  iops                       = var.iops
  db_name                    = var.database_name
  password                   = var.database_password
  username                   = var.database_username
  backup_retention_period    = var.backup_retention_period
  backup_window              = var.backup_window
  maintenance_window         = var.maintenance_window
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  final_snapshot_identifier  = "final-snapshot-${local.resource_identifier}"
  skip_final_snapshot        = var.skip_final_snapshot
  copy_tags_to_snapshot      = var.copy_tags_to_snapshot
  multi_az                   = var.multi_availability_zone
  port                       = var.database_port
  vpc_security_group_ids     = var.security_group_ids
  db_subnet_group_name       = aws_db_subnet_group.default.name
  parameter_group_name       = var.parameter_group
  storage_encrypted          = var.storage_encrypted
  monitoring_interval        = var.monitoring_interval
  monitoring_role_arn        = var.monitoring_interval > 0 ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/AmazonRDSEnhancedMonitoringRole" : ""
  deletion_protection        = var.deletion_protection
  tags                       = merge(local.default_tags, var.extra_tags)
}
