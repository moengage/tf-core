output function_name {
    description = "The name of the Lambda function"
    value = aws_lambda_function.lambda_with_image.function_name
}

output "api_key" {
  value = aws_api_gateway_api_key.apigw_key.value
}
