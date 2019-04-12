data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_route_table" "selected" {
  vpc_id = "${data.aws_vpc.selected.id}"

  tags {
    ResourceType  = "public"
    ResourceGroup = "management"
  }
}

data "aws_vpc_endpoint" "s3" {
  vpc_id       = "${data.aws_vpc.selected.id}"
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
}
