output "endpoint" {
  value = "${aws_eks_cluster.default.endpoint}"
}

output "kubeconfig_certificate_authority_data" {
  value = "${aws_eks_cluster.default.certificate_authority.0.data}"
}

output "controlplane_security_group" {
  value = "${join(",", aws_security_group.default.*.id)}"
}
