data "aws_region" "current" {
}

data "aws_iam_policy_document" "default" {
  statement {
    sid = "EKSClusterAssumeRole"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "worker_default" {
  statement {
    sid = "EC2EKSWorkerAssumeRole"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "template_file" "config_map_aws_auth" {
  count    = var.create_worker_iam_role ? 1 : 0
  template = file("${path.module}/templates/config_map_aws_auth.tpl")

  vars = {
    aws_iam_role_arn = aws_iam_role.worker_default[0].arn
  }
}

data "template_file" "kubeconfig" {
  template = file("${path.module}/templates/kubeconfig.tpl")

  vars = {
    kubeconfig_name           = aws_eks_cluster.default.name
    endpoint                  = aws_eks_cluster.default.endpoint
    region                    = data.aws_region.current.name
    cluster_auth_base64       = aws_eks_cluster.default.certificate_authority[0].data
    aws_authenticator_command = var.authenticator_command
  }
}

data "external" "thumbprint" {
  program = ["kubergrunt", "eks", "oidc-thumbprint", "--issuer-url", aws_eks_cluster.default.identity.0.oidc.0.issuer]
}

