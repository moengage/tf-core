# tf-core

Core Terraform modules to create infrastructure resources with default tags. This modules can be used to write simple terraform modules to manage infrastructure.

# Important Notes

  - `Naming Convention:` Resource names are dynamically generated using provided variables. We follow
some convention while naming resources, please go through
`locals.tf`/`resource_identifier` to understand pattern.
  - `Permanent Resources:` These resources will be created no matter what
  - `Optional Resources:` These resources are optional, will be created if flag
      variables are on.

# Modules

  - `state_backend:` # We keep state in S3 and for state locking use DynamoDB. Every environment/cluster should implement this exactly once.
    - `1 S3 Bucket`
    - `1 DynamoDB Table`

  - `vpc:` # Every environment/cluster should implement this exactly once and
try to re-use common resources (NAT Gateways, Public Route Table, VPC Endpoint) as much as possible
    - Permanent resources
      - `1 VPC`
      - `1 Internet Gateway`
      - `1 Public Route Table` # This route table should be used while creating team/business specific `subnet_resources`
      - `<n> Management Public Subnets` # These subnets are used for NAT Gateways, `n = no. of AZs`
      - `<n> Elastic IPs for Nat Gateways`
      - `<n> Nat Gateways` # Per AZ. These NAT Gateways should be used for creating team/business specific `subnet_resources`
      - `1 VPC Endpoint for S3` # Automatically attached to public, This endpoint should be attached to specific route tables while creating team/business specific `subnet_resources`
    - Optional resources
      - `Flow log` # If VPC flow logs enabled
      - `1 Cloudwatch Log Group for Flow log`
      - `IAM Role and Policy for flow logs`

  - `subnet_resources:` # Each team/business should implement this module to
    create their subnets and other resources. Any network related code for
    team/businesses should go here.
    - Permanent resources
      - `<n> private subnets and <n> public subnets` # `n = no. of AZs`
      - `<n> route tables for each private subnet`
      - `<n> network ACLS for each private subnet`
      - `<n> S3 VPC endpoint association for private subnets`
      - `<n> NAT Gateway route and <n> route association with private subnets`
      - `<n> Public Route Table association with just created public subnets`

  - Other modules can be used when they are needed

