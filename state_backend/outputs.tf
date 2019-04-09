output "bucket" {
  value       = "${aws_s3_bucket.default.id}"
  description = "Bucket ID"
}

output "dynamodb_table" {
  value       = "${aws_dynamodb_table.default.id}"
  description = "DynamoDB table ID"
}
