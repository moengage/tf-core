resource "aws_s3_bucket" "default" {
  bucket = "${local.resource_identifier}-kops-state-storage"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-kops-state-storage"
    },
  )
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket = aws_s3_bucket.default.id

  block_public_acls   = true
  block_public_policy = true
}
