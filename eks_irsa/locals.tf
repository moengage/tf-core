locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = lower(data.aws_region.current.name)
    CreatedBy   = lower(var.created_by)
    Cluster     = lower(var.cluster)
    Environment = lower(var.environment)
    Team        = lower(var.team)
    Business    = var.business
  }

  resource_identifier = "${lower(data.aws_region.current.name)}-${lower(var.eks_cluster_name)}-${lower(var.kubernetes_service_account_namespace)}-${lower(var.kubernetes_service_account_name)}"

  oidc_issuer     = "${replace(data.aws_eks_cluster.default.identity.0.oidc.0.issuer, "https://", "")}"
  oidc_issuer_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.oidc_issuer}"
}
