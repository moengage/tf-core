resource "aws_dynamodb_table" "default" {
  name           = "${local.resource_identifier}-terraform-state-lock"
  hash_key       = local.hash_key
  read_capacity  = var.dynamodb_read_capacity_unit
  write_capacity = var.dynamodb_write_capacity_unit

  attribute {
    name = local.hash_key
    type = "S"
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-terraform-state-lock"
    },
  )
}

