resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.default.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
}

resource "aws_vpc_endpoint_route_table_association" "public_s3" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = aws_route_table.public.id
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  count           = length(var.management_private_subnets)
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = element(aws_route_table.private[*].id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  count           = length(var.management_intra_subnets)
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id  = element(aws_route_table.intra[*].id, count.index)
}
