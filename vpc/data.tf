data "aws_region" "current" {
}

data "aws_availability_zones" "available" {
  state = "available"
}

# this data source is refreshed lazily
data "aws_subnet_ids" "management" {
  vpc_id = aws_vpc.default.id

  tags = {
    ResourceGroup = "management"
    ResourceType  = "public"
  }

  depends_on = [aws_subnet.public]
}

