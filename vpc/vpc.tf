################################################################################
# VPC
################################################################################
resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  # enable only one of the following
  #assign_generated_ipv6_cidr_block = true
  assign_generated_ipv6_cidr_block = false

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-vpc"
    },
  )
}

################################################################################
# Internet Gateway
################################################################################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-vpc-igw"
    },
  )
}

################################################################################
# Publiс routes
################################################################################
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.default.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-rt-public"
    },
    {
      "ResourceType" = "public"
    },
    {
      "ResourceGroup" = "management"
    },
  )
}

resource "aws_route" "public_internet_gateway" {
  route_table_id = aws_route_table.public.id
  depends_on = [
    aws_route_table.public,
    aws_internet_gateway.igw,
  ]
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

################################################################################
# Private routes
################################################################################
resource "aws_route_table" "private" {
  count = length(var.management_private_subnets)
  vpc_id = aws_vpc.default.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-rt-private-${substr(element(var.availability_zones, count.index), -2, -1)}"
    },
    {
      "ResourceType" = "private"
    },
    {
      "ResourceGroup" = "management"
    },
  )
}

resource "aws_route" "private_nat_gateway" {
  count                   = length(var.management_private_subnets)
  route_table_id         = element(aws_route_table.private[*].id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.nat_gw[*].id, count.index)
}

################################################################################
# Intra routes
################################################################################
resource "aws_route_table" "intra" {
  vpc_id = aws_vpc.default.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-rt-intra"
    },
    {
      "ResourceType" = "intra"
    },
    {
      "ResourceGroup" = "management"
    },
  )
}

################################################################################
# Public subnet
################################################################################
resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.management_public_subnets[element(var.availability_zones, count.index)]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  # if ipv6 enabled vpc, enable following lines
  #ipv6_cidr_block                = "${cidrsubnet(aws_vpc.default.ipv6_cidr_block, 10, count.index)}"
  #assign_ipv6_address_on_creation = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "management-public-${substr(element(var.availability_zones, count.index), -2, -1)}"
    },
    {
      "ResourceType" = "public"
    },
    {
      "ResourceGroup" = "management"
    },
  )
}

################################################################################
# Private subnet
################################################################################
resource "aws_subnet" "private" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.management_private_subnets[element(var.availability_zones, count.index)]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  # if ipv6 enabled vpc, enable following lines
  #ipv6_cidr_block                = "${cidrsubnet(aws_vpc.default.ipv6_cidr_block, 10, count.index)}"
  #assign_ipv6_address_on_creation = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "management-private-${substr(element(var.availability_zones, count.index), -2, -1)}"
    },
    {
      "ResourceType" = "private"
    },
    {
      "ResourceGroup" = "management"
    },
  )
}

################################################################################
# Intra subnet
################################################################################
resource "aws_subnet" "intra" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.management_intra_subnets[element(var.availability_zones, count.index)]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  # if ipv6 enabled vpc, enable following lines
  #ipv6_cidr_block                = "${cidrsubnet(aws_vpc.default.ipv6_cidr_block, 10, count.index)}"
  #assign_ipv6_address_on_creation = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "management-intra-${substr(element(var.availability_zones, count.index), -2, -1)}"
    },
    {
      "ResourceType" = "intra"
    },
    {
      "ResourceGroup" = "management"
    },
  )
}

################################################################################
# NAT Gateway
################################################################################
resource "aws_eip" "nat_gw_eip" {
  count = length(var.availability_zones)
  vpc   = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-vpc-nat-gw-eip-${count.index}"
    },
  )
}

resource "aws_nat_gateway" "nat_gw" {
  count         = length(var.availability_zones)
  allocation_id = element(aws_eip.nat_gw_eip.*.id, count.index)
  subnet_id     = element(tolist(data.aws_subnet_ids.management.ids), count.index)

  depends_on = [aws_internet_gateway.igw]

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.resource_identifier}-vpc-nat-gw-${substr(element(var.availability_zones, count.index), -2, -1)}"
    },
    {
      "AvaiabilityZone" = element(var.availability_zones, count.index)
    },
  )

  lifecycle {
    ignore_changes = [subnet_id]
  }
}

################################################################################
# Route table association
################################################################################

resource "aws_route_table_association" "public" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.management_private_subnets)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = element(aws_route_table.private[*].id, count.index)
}

resource "aws_route_table_association" "intra" {
  count          = length(var.management_intra_subnets)
  subnet_id      = element(aws_subnet.intra[*].id, count.index)
  route_table_id = aws_route_table.intra.id
}

# If ipv6 enabled vpc, enable below
#resource "aws_egress_only_internet_gateway" "default" {
#  vpc_id = "${aws_vpc.default.id}"
#}
