resource "aws_s3_bucket" "default" {
  bucket = local.resource_identifier
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

