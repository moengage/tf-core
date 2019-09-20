output "endpoint" {
  value = aws_eks_cluster.default.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.default.certificate_authority[0].data
}

output "controlplane_security_group" {
  value = join(",", aws_security_group.default.*.id)
}

output "worker_security_group" {
  value = join(",", aws_security_group.worker_default.*.id)
}

output "worker_role_name" {
  value = join(",", aws_iam_role.worker_default.*.name)
}

output "worker_role_arn" {
  value = join(",", aws_iam_role.worker_default.*.arn)
}

output "config_map_aws_auth" {
  description = "Kubernetes ConfigMap configuration for worker nodes to join the EKS cluster. https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html#required-kubernetes-configuration-to-join-worker-nodes"
  value       = join("", data.template_file.config_map_aws_auth.*.rendered)
}

output "kubeconfig" {
  value = join("", data.template_file.kubeconfig.*.rendered)
}

