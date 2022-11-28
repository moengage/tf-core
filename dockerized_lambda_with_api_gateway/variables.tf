variable "function_name" {
  description = "A unique name for your Lambda Function"
  type        = string
}

variable "image_uri" {
  description = "ECR image to be used"
  type        = string
}

variable "description" {
  description = "Description for your Lambda Function"
  type        = string
}

variable "lambda_role" {
  description = "IAM role ARN attached to the Lambda Function"
  type        = string
}

variable "memory_size" {
  type    = number
  default = 256
}

variable "timeout" {
  type    = number
  default = 60
}

variable "created_by" {
  description = "A maintainer tag will be added to aws launched resources"
  type        = string
}

variable "business_name" {
  description = "A Business tag will be used on aws resources for costs calculation"
  type        = string
}

variable "service_name" {
  description = "Service name will be used for components in business"
  type        = string
}

variable "subservice_name" {
  description = "SubService name will be used for exact function what will be this used for"
  type        = string
}

variable "extra_tags" {
  description = "extra tags to be appended to the lambda"
  type = map(string)
  default     = {}
}

variable "environment_variables" {
  description = "A map that defines environment variables for the Lambda Function."
  type        = map(string)
  default     = {}
}

variable "vpc_subnet_ids" {
  description = "List of subnet ids when Lambda Function should run in the VPC. Usually private or intra subnets."
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "List of security group ids when Lambda Function should run in the VPC."
  type        = list(string)
}

variable "retention_in_days" {
  type    = number
  default = 7
}

variable "stage" {
  type    = string
  default = "default"
}

variable "method" {
  type    = string
  default = "ANY"
}

variable "authorization" {
  type    = string
  default = "NONE"
}

variable "binary_media_types" {
  default = []
}

variable "lambda_integration_type" {
  type    = string
  default = "AWS_PROXY"
}
