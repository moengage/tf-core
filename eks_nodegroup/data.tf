data "aws_eks_cluster" "default" {
  name = var.cluster_name
}

data "template_file" "userdata" {
  template = file("${path.module}/templates/userdata.tpl")

  vars = {
    cluster_endpoint           = data.aws_eks_cluster.default.endpoint
    certificate_authority_data = data.aws_eks_cluster.default.certificate_authority[0].data
    cluster_name               = data.aws_eks_cluster.default.name
    bootstrap_extra_args       = var.bootstrap_extra_args
    registry_ids               = join(" ", var.ecr_cross_account_registry_ids)
    cross_account_ecr_enabled  = length(var.ecr_cross_account_registry_ids) > 0
  }
}

data "aws_security_group" "default" {
  name = "${var.cluster_name}-worker-sg"
}

data "aws_iam_role" "default" {
  name = "${var.cluster_name}-${var.region}-eks-worker-role"
}

data "aws_region" "current" {
}

data "aws_ssm_parameter" "default" {
  name = "/aws/service/eks/optimized-ami/${var.cluster_version}/amazon-linux-2${local._architecture_suffix[var.architecture]}/recommended/image_id"
}

