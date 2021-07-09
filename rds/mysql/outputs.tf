output "db_instance_address" {
  value       = aws_db_instance.default.address
  description = "The hostname of the RDS instance. See also endpoint and port."
}

output "db_instance_endpoint" {
  value       = aws_db_instance.default.endpoint
  description = ".The connection endpoint in address:port format."
}

output "db_instance_id" {
  value       = aws_db_instance.default.id
  description = "The RDS instance ID."
}

output "db_instance_username" {
  value       = aws_db_instance.default.username
  description = "The master username for the database."
}

output "db_option_group_id" {
  value       = aws_db_option_group.default.id
  description = "The db option group name."
}

output "db_parameter_group_id" {
  value       = aws_db_parameter_group.default.id
  description = "The db parameter group name."
}

output "db_subnet_group_id" {
  value       = aws_db_subnet_group.default.id
  description = "The db subnet group name."
}
