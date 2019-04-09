output "bucket" {
  value = "${aws_s3_bucket.default.id}"
}

output "dynamodb_table" {
  value = "${aws_dynamodb_table.default.id}"
}
