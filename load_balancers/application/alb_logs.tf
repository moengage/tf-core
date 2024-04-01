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

resource "aws_s3_bucket_policy" "alb_access_logs_bucket_policy" {
  bucket = aws_s3_bucket.logs[0].id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowELBRootAccount",
        "Effect" : "Allow",
        "Action" : "s3:PutObject",
        "Resource" : "arn:aws:s3:::${local.logs_bucket_name}/*",
        "Principal" : {
          "AWS" : "arn:aws:iam::${var.aws_lb_accounts[data.aws_region.current.name]}:root"
        }
      },
      {
        "Sid" : "AWSLogDeliveryWrite",
        "Effect" : "Allow",
        "Action" : "s3:PutObject",
        "Resource" : "arn:aws:s3:::${local.logs_bucket_name}/*",
        "Condition" : {
          "StringEquals" : {
            "s3:x-amz-acl" : "bucket-owner-full-control"
          }
        },
        "Principal" : {
          "Service" : "delivery.logs.amazonaws.com"
        }
      },
      {
        "Sid" : "AWSLogDeliveryAclCheck",
        "Effect" : "Allow",
        "Action" : "s3:GetBucketAcl",
        "Resource" : "arn:aws:s3:::${local.logs_bucket_name}",
        "Principal" : {
          "Service" : "delivery.logs.amazonaws.com"
        }
      },
      {
        "Sid" : "AllowALBAccess",
        "Effect" : "Allow",
        "Action" : "s3:PutObject",
        "Resource" : "arn:aws:s3:::${local.logs_bucket_name}/*",
        "Principal" : {
          "Service" : "elasticloadbalancing.amazonaws.com"
        }
      }
    ]
  })
}

