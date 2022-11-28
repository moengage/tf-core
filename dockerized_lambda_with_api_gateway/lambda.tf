resource "aws_lambda_function" "lambda_with_image" {
  function_name                  = var.function_name
  description                    = var.description
  role                           = var.lambda_role
  memory_size                    = var.memory_size
  timeout                        = var.timeout
  image_uri                      = var.image_uri
  package_type                   = "Image"

  dynamic "environment" {
    for_each = length(keys(var.environment_variables)) == 0 ? [] : [true]
    content {
      variables = var.environment_variables
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_subnet_ids != null && var.vpc_security_group_ids != null ? [true] : []
    content {
      security_group_ids = var.vpc_security_group_ids
      subnet_ids         = var.vpc_subnet_ids
    }
  }

   tags = merge(
    local.default_tags,
    var.extra_tags
  )

}

resource "aws_cloudwatch_log_group" "default" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.retention_in_days
}
