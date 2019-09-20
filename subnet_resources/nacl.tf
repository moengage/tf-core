# associate nacl to private subnets
resource "aws_network_acl" "private" {
  count      = length(var.availability_zones)
  vpc_id     = data.aws_vpc.selected.id
  subnet_ids = [element(aws_subnet.private.*.id, count.index)]

  tags = merge(
    {
      "Name" = "${local.resource_identifier}-nacl-private-${substr(element(var.availability_zones, count.index), -2, -1)}"
    },
    {
      "ResourceType" = "private"
    },
    {
      "ResourceGroup" = lower(var.business_name)
    },
  )
}

resource "aws_network_acl_rule" "private_ingress" {
  count          = length(var.availability_zones)
  network_acl_id = element(aws_network_acl.private.*.id, count.index)
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "private_egress" {
  count          = length(var.availability_zones)
  network_acl_id = element(aws_network_acl.private.*.id, count.index)
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

