resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  # enable only one of the following
  #assign_generated_ipv6_cidr_block = true
  assign_generated_ipv6_cidr_block = false

  tags = "${merge(
    local.default_tags,
    map("Name", "${local.resource_identifier}-vpc")
  )}"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.default.id}"

  tags = "${merge(
    local.default_tags,
    map("Name", "${local.resource_identifier}-vpc-igw"),
  )}"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.default.id}"

  tags = "${merge(
    local.default_tags,
    map("Name", "${local.resource_identifier}-rt-public"),
    map("ResourceType", "public"),
    map("ResourceGroup", "management"),
  )}"
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  depends_on             = ["aws_route_table.public", "aws_internet_gateway.igw"]
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}

# if ipv6 enabled vpc enable below
#resource "aws_route" "public_internet_gateway_ipv6" {
#  route_table_id              = "${aws_route_table.public.id}"
#  depends_on                  = ["aws_route_table.public", "aws_internet_gateway.igw"]
#  destination_ipv6_cidr_block = "::/0"
#  gateway_id                  = "${aws_internet_gateway.igw.id}"
#}

resource "aws_subnet" "public" {
  count                   = "${length(var.availability_zones)}"
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "${var.management_public_subnets[element(var.availability_zones, count.index)]}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = true

  # if ipv6 enabled vpc, enable following lines
  #ipv6_cidr_block                = "${cidrsubnet(aws_vpc.default.ipv6_cidr_block, 10, count.index)}"
  #assign_ipv6_address_on_creation = true

  tags = "${merge(
    local.default_tags,
    map("Name", "management-public-${substr(element(var.availability_zones, count.index), -2, -1)}"),
    map("ResourceType", "public"),
    map("ResourceGroup", "management"),
  )}"
}

resource "aws_eip" "nat_gw_eip" {
  count = "${length(var.availability_zones)}"
  vpc   = true

  tags = "${merge(
    local.default_tags,
    map("Name", "${local.resource_identifier}-vpc-nat-gw-eip-${count.index}"),
  )}"
}

resource "aws_route_table_association" "public" {
  count          = "${length(var.availability_zones)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_nat_gateway" "nat_gw" {
  count         = "${length(var.availability_zones)}"
  allocation_id = "${element(aws_eip.nat_gw_eip.*.id, count.index)}"
  subnet_id     = "${element(data.aws_subnet_ids.management.ids, count.index)}"

  depends_on = [
    "aws_internet_gateway.igw",
  ]

  tags = "${merge(
    local.default_tags,
    map("Name", "${local.resource_identifier}-vpc-nat-gw-${substr(element(data.aws_availability_zones.available.names, count.index),-2,-1)}"),
  )}"

  lifecycle {
    ignore_changes = [
      "subnet_id",
    ]
  }
}

# If ipv6 enabled vpc, enable below
#resource "aws_egress_only_internet_gateway" "default" {
#  vpc_id = "${aws_vpc.default.id}"
#}

