locals {
  _resource_identifier = "${var.business_name}-${var.service_name}-${var.subservice_name}"
  resource_identifier  = lower(local._resource_identifier)

  default_tags = {
    Name        = var.sg_name != "" ? var.sg_name : local.resource_identifier
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
    Environment = lower(var.environment)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
    SubService  = lower(var.subservice_name)
  }
  tags = merge(var.tags, local.default_tags)

# generate map from ingress_rules list for aws_security_group_rule for_each argument
  keyed_rules = { for rule in var.ingress_rules : rule.unique_key => {
    unique_key  = rule.unique_key
    type        = "ingress"
    from_port   = rule.from_port
    to_port     = rule.to_port
    protocol    = rule.protocol
    description = "[TF]${rule.description}"

    # Convert a missing key, a value of null, or a value of empty list to []
    cidr_blocks      = try(length(rule.cidr_blocks), 0) > 0 ? rule.cidr_blocks : []
    ipv6_cidr_blocks = try(length(rule.ipv6_cidr_blocks), 0) > 0 ? rule.ipv6_cidr_blocks : []
    prefix_list_ids  = try(length(rule.prefix_list_ids), 0) > 0 ? rule.prefix_list_ids : []

    source_security_group_id = lookup(rule, "source_security_group_id", null)
    security_groups          = []

    self = lookup(rule, "self", null)
  }}

}
