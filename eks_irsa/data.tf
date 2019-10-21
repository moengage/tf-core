data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "default" {
  name = "${var.eks_cluster_name}"
}
