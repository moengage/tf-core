# tf-core

Core Terraform modules to create infrastructure resources with default tags. This modules can be used to write simple terraform modules to manage infrastructure.

Resource names are dynamically generated using provided variables. We follow
some convention while naming resources, please go through
`locals.tf`/`resource_identifier` to understand pattern.

# Modules
  - `state_backend`:
    - `1 S3 Bucket`
    - `1 DynamoDB Table`

  - `vpc`:
    - Permanent resources
      - `1 VPC`
      - `1 Internet Gateway`
      - `1 Public Route Table` # This route table should be used while creating team/business specific `subnet_resources`
      - `<n> Management Public Subnets` # These subnets are used for NAT Gateways, n = no. of AZs
      - `<n> Elastic IPs for Nat Gateways`
      - `<n> Nat Gateways` # Per AZ. These NAT Gateways should be used for creating team/business specific `subnet_resources`
      - `1 VPC Endpoint for S3` # Automatically attached to public, This endpoint should be attached to specific route tables while creating team/business specific `subnet_resources`
    - Optional resources
      - `Flow log` # If VPC flow logs enabled
      - `1 Cloudwatch Log Group for Flow log`
      - `IAM Role and Policy for flow logs`

  - `subnet_resources`
