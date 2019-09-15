resource "aws_iam_role" "default" {
  count                 = "${var.manage_iam_resources ? 1 : 0}"
  name                  = "${local.iam_resource_identifier}-eks-cluster-role"
  assume_role_policy    = "${data.aws_iam_policy_document.default.json}"
  path                  = "${local.iam_resource_path}"
  force_detach_policies = true

  tags = "${merge(
    map("Name", "${local.iam_resource_identifier}-eks-cluster-role"),
    local.default_tags,
    var.extra_tags
  )}"
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  count      = "${var.manage_iam_resources ? 1 : 0}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.default.name}"
}

resource "aws_iam_role_policy_attachment" "eks_service_policy" {
  count      = "${var.manage_iam_resources ? 1 : 0}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.default.name}"
}

resource "aws_iam_role" "worker_default" {
  count                 = "${var.create_worker_iam_role ? 1 : 0}"
  name                  = "${local.iam_resource_identifier}-eks-worker-role"
  assume_role_policy    = "${data.aws_iam_policy_document.worker_default.json}"
  force_detach_policies = true

  tags = "${merge(
    map("Name", "${local.iam_resource_identifier}-eks-worker-role"),
    local.default_tags,
    var.extra_tags
  )}"
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  count      = "${var.create_worker_iam_role ? 1 : 0}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.worker_default.name}"
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  count      = "${var.create_worker_iam_role ? 1 : 0}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "${aws_iam_role.worker_default.name}"
}

resource "aws_iam_role_policy_attachment" "ecr_readonly_policy" {
  count      = "${var.create_worker_iam_role ? 1 : 0}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = "${aws_iam_role.worker_default.name}"
}
