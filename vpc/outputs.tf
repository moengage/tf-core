output "vpc" {
  value       = "${format("%v - %v", aws_vpc.default.id, aws_vpc.default.cidr_block)}"
  description = "VPC ID - CIDR Block"
}

output "igw_id" {
  value       = "${aws_internet_gateway.igw.id}"
  description = "Internet Gateway ID"
}

output "nat_gws" {
  value       = "${formatlist("%v - %v - %v", aws_nat_gateway.nat_gw.*.id, aws_nat_gateway.nat_gw.*.private_ip, aws_nat_gateway.nat_gw.*.public_ip)}"
  description = "NAT Gateway IDs - NAT Gateway Private IPs - NAT Gateway Public Elastic IPs"
}

output "s3_vpc_endpoint" {
  value       = "${format("%v - %v", aws_vpc_endpoint.s3.id, aws_vpc_endpoint.s3.state)}"
  description = "S3 VPC Endpoint - State"
}
