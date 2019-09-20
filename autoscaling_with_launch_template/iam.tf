resource "aws_iam_role" "asg_notifications_role" {
  count = var.notification_enabled ? 1 : 0
  name  = "${local.iam_resource_identifier}-asg-notifications-role"
  path  = local.iam_resource_path

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "autoscaling.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF

}

resource "aws_iam_role_policy" "asg_sns_access" {
  count = var.notification_enabled ? 1 : 0
  name  = "${local.iam_resource_identifier}-asg-sns-access-policy"
  role  = aws_iam_role.asg_notifications_role[0].id

  policy = <<EOF
{
  "Statement": [
    {
      "Action": [
        "sns:Publish"
      ],
      "Effect": "Allow",
      "Resource": "${aws_sns_topic.default[0].arn}"
    }
  ]
}
EOF

}

