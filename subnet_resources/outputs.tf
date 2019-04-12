output "public_subnets" {
  value = "${formatlist("%v - %v - %v", aws_subnet.public.*.id, aws_subnet.public.*.availability_zone, aws_subnet.public.*.cidr_block)}"
}

output "private_subnets" {
  value = "${formatlist("%v - %v - %v", aws_subnet.private.*.id, aws_subnet.private.*.availability_zone, aws_subnet.private.*.cidr_block)}"
}

output "private_nacls" {
  value = "${formatlist("%v - %v", aws_network_acl.private.*.id, join(",", aws_network_acl.private.*.subnet_ids))}"
}
