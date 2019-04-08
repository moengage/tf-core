resource "aws_flow_log" "all" {
  count          = "${var.enable_flow_logs ? 1 : 0}"
  log_group_name = "${aws_cloudwatch_log_group.flow_logs.name}"
  iam_role_arn   = "${aws_iam_role.vpc_flow_logs.arn}"
  vpc_id         = "${aws_vpc.default.id}"
  traffic_type   = "ALL"
}

resource "aws_cloudwatch_log_group" "flow_logs" {
  count             = "${var.enable_flow_logs ? 1 : 0}"
  name              = "/vpc-flow-logs/${aws_vpc.default.id}"
  retention_in_days = "${var.flow_logs_retention_in_days}"

  tags = "${merge(
    local.default_tags,
    map("Name", "${local.vpc_name}-vpc-flow-logs"),
  )}"
}

resource "aws_iam_role" "vpc_flow_logs" {
  count = "${var.enable_flow_logs ? 1 : 0}"
  name  = "${local.vpc_name}-vpc-flow-logs}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "vpc_flow_logs_policy" {
  count = "${var.enable_flow_logs ? 1 : 0}"
  name  = "${local.vpc_name}-vpc-flow-logs-policy"
  role  = "${aws_iam_role.vpc_flow_logs.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
