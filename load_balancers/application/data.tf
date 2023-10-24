data "aws_region" "current" {
}

data "aws_iam_policy_document" "allow-lb" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["${var.aws_lb_accounts[data.aws_region.current.name]}"]
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.logs[0].arn}/*"
    ]
  }
}