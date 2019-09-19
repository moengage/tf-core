resource "aws_security_group" "default" {
  count  = "${var.create_controlplane_security_group ? 1 : 0}"
  name   = "${local.resource_identifier}-controlplane-sg"
  vpc_id = "${var.vpc_id}"

  tags = "${merge(
    map("Name", "${local.resource_identifier}-controlplane-sg"),
    local.default_tags,
    var.extra_tags,
    map("kubernetes.io/cluster/${local.resource_identifier}", "owned")
  )}"
}

resource "aws_security_group" "worker_default" {
  count  = "${var.create_worker_security_group ? 1 : 0}"
  name   = "${local.resource_identifier}-worker-sg"
  vpc_id = "${var.vpc_id}"

  tags = "${merge(
    map("Name", "${local.resource_identifier}-worker-sg"),
    local.default_tags,
    var.extra_tags,
    map("kubernetes.io/cluster/${local.resource_identifier}", "owned")
  )}"
}

resource "aws_security_group_rule" "default_ingress" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.default.id}"
  source_security_group_id = "${aws_security_group.worker_default.id}"
  description              = "Allow workers to communicate with master"
}

resource "aws_security_group_rule" "default_egress" {
  type                     = "egress"
  from_port                = 1025
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.default.id}"
  source_security_group_id = "${aws_security_group.worker_default.id}"
  description              = "Allow the cluster control plane to communicate with worker Kubelet and pods"
}

resource "aws_security_group_rule" "default_egress_2" {
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.default.id}"
  source_security_group_id = "${aws_security_group.worker_default.id}"
  description              = "Allow the cluster control plane to communicate with pods running extension API servers on port 443"
}

resource "aws_security_group_rule" "worker_default_ingress" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.worker_default.id}"
  source_security_group_id = "${aws_security_group.default.id}"
  description              = "Allow pods running extension API servers on port 443 to receive communication from cluster control plane"
}

resource "aws_security_group_rule" "worker_default_ingress_2" {
  type                     = "ingress"
  from_port                = 1025
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.worker_default.id}"
  source_security_group_id = "${aws_security_group.default.id}"
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
}

resource "aws_security_group_rule" "worker_default_ingress_self" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.worker_default.id}"
  self              = true
  description       = "Allow node to communicate with each other"
}

resource "aws_security_group_rule" "worker_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "-1"
  security_group_id = "${aws_security_group.worker_default.id}"
  description       = "Allow all out bound communication"
}
