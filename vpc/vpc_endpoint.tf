resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.default.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
}

resource "aws_vpc_endpoint_route_table_association" "public_s3" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = aws_route_table.public.id
}

resource "aws_vpc_endpoint_route_table_association" "intra_s3" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = aws_route_table.intra.id
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  count           = length(var.management_private_subnets)
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = element(aws_route_table.private[*].id, count.index)
}

resource "aws_security_group" "sqs_vpc_endpoint" {
  name        = "${local.resource_identifier}-sqs-vpc-ep-sg"
  description = "Allow TLS inbound traffic for sqs endpoint"
  vpc_id      = aws_vpc.default.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.default.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc_endpoint" "sqs" {
  vpc_id            = aws_vpc.default.id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.sqs"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sqs_vpc_endpoint.id,
  ]
  subnet_ids          = data.aws_subnet_ids.management_private.ids
  private_dns_enabled = true
  depends_on          = [aws_subnet.private]
}
