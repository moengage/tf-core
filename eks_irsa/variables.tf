variable "eks_cluster_name" {
  description = "AWS EKS Cluster Name"
}

variable "created_by" {
  description = "Created by"
}

variable "cluster" {
  description = "AWS Unique Resource Identifier"
  default     = "default"
}

variable "environment" {
  description = "Environment"
}

variable "team" {
  description = "Team"
}

variable "business" {
  description = "Business name"
}

variable "kubernetes_service_account_namespace" {
  description = "Kubernetes Service Account Namespace"
}

variable "kubernetes_service_account_name" {
  description = "Kubernetes Service Account Name"
}

variable "extra_tags" {
  description = "Extra tags"
  type        = map(string)
  default     = {}
}
