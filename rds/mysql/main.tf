
resource "aws_db_instance" "default" {
  engine                              = "mysql"
  option_group_name                   = aws_db_option_group.default.name
  parameter_group_name                = aws_db_parameter_group.default.name
  db_subnet_group_name                = aws_db_subnet_group.default.name
  vpc_security_group_ids              = var.vpc_security_group_ids
  identifier                          = local.resource_identifier
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  allocated_storage                   = var.allocated_storage
  username                            = var.username
  password                            = var.password
  maintenance_window                  = var.maintenance_window
  backup_window                       = var.backup_window
  apply_immediately                   = var.apply_immediately
  multi_az                            = var.multi_az 
  port                                = var.port
  name                                = var.service_name
  storage_type                        = var.storage_type
  iops                                = var.iops
  auto_minor_version_upgrade          = var.auto_minor_version_upgrade
  allow_major_version_upgrade         = var.allow_major_version_upgrade
  backup_retention_period             = var.backup_retention_period
  storage_encrypted                   = var.storage_encrypted
  kms_key_id                          = var.kms_key_id
  deletion_protection                 = var.deletion_protection
  final_snapshot_identifier           = var.final_snapshot_identifier
  skip_final_snapshot                 = var.skip_final_snapshot
  snapshot_identifier                 = var.snapshot_identifier
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
  monitoring_interval                 = var.monitoring_interval
  monitoring_role_arn                 = var.monitoring_role_arn
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  copy_tags_to_snapshot               = var.copy_tags_to_snapshot
  publicly_accessible                 = var.publicly_accessible
  ca_cert_identifier                  = var.ca_cert_identifier
  license_model                       = var.license_model
  tags                                = local.default_tags
  lifecycle {
    ignore_changes = [password]
  }
}
# https://www.terraform.io/docs/providers/aws/r/db_option_group.html
resource "aws_db_option_group" "default" {
  engine_name              = "mysql"
  name                     = local.resource_identifier
  major_engine_version     = local.major_engine_version
  option_group_description = var.description

  tags = local.default_tags
}

# https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html
resource "aws_db_parameter_group" "default" {
  name        = local.resource_identifier
  family      = local.family
  description = var.description

  parameter {
    name         = "character_set_client"
    value        = var.character_set
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_connection"
    value        = var.character_set
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_database"
    value        = var.character_set
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_results"
    value        = var.character_set
    apply_method = "immediate"
  }

  parameter {
    name         = "character_set_server"
    value        = var.character_set
    apply_method = "immediate"
  }

  parameter {
    name         = "collation_connection"
    value        = var.collation
    apply_method = "immediate"
  }

  parameter {
    name         = "collation_server"
    value        = var.collation
    apply_method = "immediate"
  }

  parameter {
    name         = "time_zone"
    value        = var.time_zone
    apply_method = "immediate"
  }

  parameter {
    name         = "tx_isolation"
    value        = var.tx_isolation
    apply_method = "immediate"
  }

  tags = local.default_tags
}

# https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html
resource "aws_db_subnet_group" "default" {
  name        = local.resource_identifier
  subnet_ids  = var.subnet_ids
  description = var.description

  tags = local.default_tags
}


