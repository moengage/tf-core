resource "aws_s3_bucket" "default" {
  bucket = var.use_unique_prefix ? local.resource_identifier : lower(var.bucket_name)
  acl    = var.acl

  versioning {
    enabled = var.versioning_enabled
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = local.resource_identifier
    },
  )
}


resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket                  = aws_s3_bucket.default.id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}