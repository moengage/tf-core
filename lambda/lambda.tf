resource "aws_lambda_function" "default" {
  function_name                  = var.function_name
  description                    = var.description
  role                           = var.lambda_role
  handler                        = var.handler
  memory_size                    = var.memory_size
  runtime                        = var.runtime
  timeout                        = var.timeout
  filename                       = var.filename


  tags = merge(
    local.default_tags,
    var.extra_tags
  )

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
}

resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = 7
}






