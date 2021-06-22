variable "environment" {
  type        = string
  description = "Name of environment - staging/prod"
}

variable "database_name" {
  type        = string
  description = "Name of database inside storage engine"
}

variable "business_name" {
  type        = string
  description = "Business Name"
}

variable "service_name" {
  type        = string
  description = "Service name"
}

variable "subservice_name" {
  type        = string
  description = "Sub Service name"
}

variable "allocated_storage" {
  default     = 32
  type        = number
  description = "Storage allocated to database instance"
}

variable "engine_version" {
  default     = "11.5"
  type        = string
  description = "Database engine version"
}

variable "instance_type" {
  default     = "db.t3.micro"
  type        = string
  description = "Instance type for database instance"
}

variable "storage_type" {
  default     = "gp2"
  type        = string
  description = "Type of underlying storage for database"
}

variable "iops" {
  default     = 0
  type        = number
  description = "The amount of provisioned IOPS"
}

variable "snapshot_identifier" {
  default     = ""
  type        = string
  description = "The name of the snapshot (if any) the database should be created from"
}

variable "database_username" {
  type        = string
  description = "Name of user inside storage engine"
}

variable "database_password" {
  type        = string
  description = "Database password inside storage engine"
}

variable "database_port" {
  default     = 5432
  type        = number
  description = "Port on which database will accept connections"
}

variable "backup_retention_period" {
  default     = 30
  type        = number
  description = "Number of days to keep database backups"
}

variable "backup_window" {
  default     = "04:00-04:30"
  type        = string
  description = "30 minute time window to reserve for backups"
}

variable "maintenance_window" {
  default     = "sun:04:30-sun:05:30"
  type        = string
  description = "60 minute time window to reserve for maintenance"
}

variable "auto_minor_version_upgrade" {
  default     = false
  type        = bool
  description = "Minor engine upgrades are applied automatically to the DB instance during the maintenance window"
}

variable "skip_final_snapshot" {
  default     = true
  type        = bool
  description = "Flag to enable or disable a snapshot if the database instance is terminated"
}

variable "copy_tags_to_snapshot" {
  default     = true
  type        = bool
  description = "Flag to enable or disable copying instance tags to the final snapshot"
}

variable "multi_availability_zone" {
  default     = false
  type        = bool
  description = "Flag to enable hot standby in another availability zone"
}

variable "storage_encrypted" {
  default     = true
  type        = bool
  description = "Flag to enable storage encryption"
}

variable "monitoring_interval" {
  default     = 0
  type        = number
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected"
}

variable "deletion_protection" {
  default     = false
  type        = bool
  description = "Flag to protect the database instance from deletion"
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of VPC subnet IDs."
}

variable "parameter_group" {
  default     = "default-postgres12"
  type        = string
  description = "Database engine parameter group"
}

variable "security_group_ids" {
  description = "A list of cache security group ids to associate with this replication group"
  type        = list(string)
}

variable "subnet_group_description" {
  default     = "Database subnet group"
  type        = string
  description = "Database subnet group"
}

variable "extra_tags" {
  default     = {}
  type        = map(any)
  description = "extra tags"
}
