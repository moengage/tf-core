resource "aws_subnet" "private" {
  count             = "${length(var.availability_zones)}"
  vpc_id            = "${data.aws_vpc.selected.id}"
  cidr_block        = "${var.private_subnets[element(var.availability_zones, count.index)]}"
  availability_zone = "${element(var.availability_zones, count.index)}"

  tags = "${merge(
    local.default_tags,
    map("Name", "${local.resource_identifier}-private-${substr(element(var.availability_zones, count.index), -2, -1)}"),
    map("ResourceType", "private"),
    map("ResourceGroup", "${lower(var.business_name)}"),
  )}"
}

resource "aws_route_table" "private" {
  count  = "${length(var.availability_zones)}"
  vpc_id = "${data.aws_vpc.selected.id}"

  tags = "${merge(
    local.default_tags,
    map("Name", "${local.resource_identifier}-rt-private-${substr(element(var.availability_zones, count.index), -2, -1)}"),
    map("ResourceType", "private"),
    map("ResourceGroup", "${lower(var.business_name)}"),
  )}"
}

resource "aws_route" "private_route_to_nat_gw" {
  count                  = "${length(var.availability_zones)}"
  route_table_id         = "${element(aws_route_table.private.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = ["aws_route_table.private"]
  nat_gateway_id         = "${var.nat_gateways[element(var.availability_zones, count.index)]}"
}

resource "aws_route_table_association" "private" {
  count          = "${length(var.availability_zones)}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_subnet" "public" {
  count                   = "${length(var.availability_zones)}"
  vpc_id                  = "${data.aws_vpc.selected.id}"
  cidr_block              = "${var.public_subnets[element(var.availability_zones, count.index)]}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = true

  tags = "${merge(
    local.default_tags,
    map("Name", "${local.resource_identifier}-public-${substr(element(var.availability_zones, count.index), -2, -1)}"),
    map("ResourceType", "public"),
    map("ResourceGroup", "${lower(var.business_name)}"),
  )}"
}

resource "aws_route_table_association" "public" {
  count          = "${length(var.availability_zones)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${data.aws_route_table.selected.id}"
}
