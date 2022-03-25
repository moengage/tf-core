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
