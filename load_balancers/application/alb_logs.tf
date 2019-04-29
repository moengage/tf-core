resource "aws_s3_bucket" "logs" {
  count         = "${var.lb_access_logs_enabled ? 1 : 0}"
  bucket        = "${local.logs_bucket_name}"
  acl           = "log-delivery-write"
  force_destroy = true

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "${var.aws_lb_accounts[data.aws_region.current.name]}"
        ]
      },
      "Action": [
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3:::${local.logs_bucket_name}/*"
    }
  ]
}
EOF

  lifecycle_rule {
    id      = "cleanup"
    enabled = true

    expiration {
      days = "${var.lb_logs_retention_days}"
    }
  }

  lifecycle_rule {
    id                                     = "cleanup_incomplete_multipart_uploads"
    enabled                                = true
    abort_incomplete_multipart_upload_days = 2
  }

  tags = "${merge(
    local.default_tags,
    map("Name", "${local.logs_bucket_name}"),
  )}"
}
