output "role_name" {
  description = "Name of Role created for service account"
  value       = "${aws_iam_role.default.name}"
}

output "role_arn" {
  description = "ARN of role created for service account"
  value       = "${aws_iam_role.default.arn}"
}
