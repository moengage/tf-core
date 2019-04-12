# associate nacl to private subnets
resource "aws_network_acl" "private" {
  count      = "${length(var.availability_zones)}"
  vpc_id     = "${data.aws_vpc.selected.id}"
  subnet_ids = ["${element(aws_subnet.private.*.id, count.index)}"]

  tags = "${merge(
    map("Name", "${local.resource_identifier}-nacl-private-${substr(element(var.availability_zones, count.index), -2, -1)})"),
    map( "ResourceType", "private" ),
    map( "ResourceGroup", "${lower(var.business_name)}" )
)}"
}
