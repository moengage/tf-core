data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

data "aws_route_table" "selected" {
  vpc_id = "${var.vpc_id}"

  tags {
    ResourceType  = "public"
    ResourceGroup = "management"
  }
}

data "aws_vpc_endpoint" "s3" {
  vpc_id       = "${aws_vpc.foo.id}"
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
}
