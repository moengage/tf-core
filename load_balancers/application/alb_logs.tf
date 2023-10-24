resource "aws_s3_bucket" "logs" {
  count         = var.lb_access_logs_enabled ? 1 : 0
  bucket        = local.logs_bucket_name
  force_destroy = true
  acl           = "private"

  lifecycle_rule {
    id      = "cleanup"
    enabled = true

    expiration {
      days = var.lb_logs_retention_days
    }
  }

  lifecycle_rule {
    id                                     = "cleanup_incomplete_multipart_uploads"
    enabled                                = true
    abort_incomplete_multipart_upload_days = 2
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = local.logs_bucket_name
    },
  )
}

resource "aws_s3_bucket_acl" "lb-logs-acl" {
  bucket = aws_s3_bucket.logs[0].id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "allow-lb" {
  bucket = aws_s3_bucket.logs[0].id
  policy = data.aws_iam_policy_document.allow-lb.json
}

