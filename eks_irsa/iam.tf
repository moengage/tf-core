resource "aws_iam_role" "default" {
  name = "${local.resource_identifier}"

  assume_role_policy = templatefile(
    "${path.module}/oidc.json",
    {
      OIDC_ARN  = "${local.oidc_issuer_arn}",
      OIDC_URL  = "${local.oidc_issuer}",
      NAMESPACE = "${var.kubernetes_service_account_namespace}",
      SA_NAME   = "${var.kubernetes_service_account_name}"
    }
  )

  tags = merge(
    local.default_tags,
    var.extra_tags,
    {
      "ServiceAccountName"      = "${var.kubernetes_service_account_name}"
      "ServiceAccountNameSpace" = "${var.kubernetes_service_account_namespace}"
    }
  )
}

