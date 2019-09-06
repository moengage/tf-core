resource "aws_eks_cluster" "default" {
  name                      = "${local.resource_identifier}"
  role_arn                  = "${var.manage_iam_resources ? aws_iam_role.default.arn : var.iam_role_arn}"
  enabled_cluster_log_types = "${var.enabled_cluster_log_types}"

  vpc_config {
    subnet_ids              = "${var.subnet_ids}"
    endpoint_private_access = "${var.enable_endpoint_private_access}"
    endpoint_public_access  = "${var.enable_endpoint_public_access}"
    security_group_ids      = ["${local.controlplane_security_group}"]
  }

  timeouts {
    create = "${var.create_timeout}"
    delete = "${var.delete_timeout}"
    update = "${var.update_timeout}"
  }

  depends_on = [
    "aws_iam_role_policy_attachment.eks_cluster_policy",
    "aws_iam_role_policy_attachment.eks_service_policy",
    "aws_cloudwatch_log_group.default",
    "aws_security_group.default",
  ]
}
