resource "aws_s3_bucket" "default" {
  bucket = "${local.resource_identifier}-terraform-state-storage"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-terraform-state-storage"
    },
  )
}

