resource "aws_api_gateway_rest_api" "lambda_api" {
  name               = "${aws_lambda_function.lambda_with_image.function_name}-api"
  description        = "Rest Api to trigger lambda functions"
  binary_media_types = var.binary_media_types
}

resource "aws_api_gateway_resource" "lambda_api_gateway" {
  path_part   = aws_lambda_function.lambda_with_image.function_name
  parent_id   = aws_api_gateway_rest_api.lambda_api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.lambda_api.id
}

resource "aws_api_gateway_stage" "stage" {
  stage_name    = var.stage
  rest_api_id   = aws_api_gateway_rest_api.lambda_api.id
  deployment_id = aws_api_gateway_deployment.api_gateway_deployment_get.id
}

resource "aws_api_gateway_usage_plan" "apigw_usage_plan" {
  name = "apigw_usage_plan"

  api_stages {
    api_id = aws_api_gateway_rest_api.lambda_api.id
    stage  =  aws_api_gateway_stage.stage.stage_name
  }
}

resource "aws_api_gateway_usage_plan_key" "apigw_usage_plan_key" {
  key_id        = aws_api_gateway_api_key.apigw_prod_key.id
  key_type      = var.key_type
  usage_plan_id = aws_api_gateway_usage_plan.apigw_usage_plan.id
}

resource "aws_api_gateway_api_key" "apigw_prod_key" {
  name = "prod_key"
}

resource "aws_api_gateway_method" "take_screenshot_get" {
  rest_api_id      = aws_api_gateway_rest_api.lambda_api.id
  resource_id      = aws_api_gateway_resource.lambda_api_gateway.id
  http_method      = var.method
  authorization    = var.authorization
  api_key_required = true
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_with_image.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.lambda_api.execution_arn}/*/*/${aws_lambda_function.lambda_with_image.function_name}"
}

resource "aws_api_gateway_integration" "lambda_integration_get" {

  rest_api_id = aws_api_gateway_rest_api.lambda_api.id
  resource_id = aws_api_gateway_method.take_screenshot_get.resource_id
  http_method = aws_api_gateway_method.take_screenshot_get.http_method

  integration_http_method = var.method 
  type                    = var.lambda_integration_type
  uri                     = aws_lambda_function.lambda_with_image.invoke_arn
}


resource "aws_api_gateway_deployment" "api_gateway_deployment_get" {
  depends_on = [aws_api_gateway_integration.lambda_integration_get,  aws_api_gateway_method.take_screenshot_get, aws_api_gateway_integration.lambda_integration_get]

  rest_api_id = aws_api_gateway_rest_api.lambda_api.id
}

