resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  count           = "${length(var.availability_zones)}"
  vpc_endpoint_id = "${data.aws_vpc_endpoint.s3.id}"
  route_table_id  = "${element(aws_route_table.private.*.id, count.index)}"
}
