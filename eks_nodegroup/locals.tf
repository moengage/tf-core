locals {
  default_tags = {
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
    CreatedBy   = lower(var.created_by)
    Environment = lower(var.environment)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
  }

  _resource_identifier = "${var.business_name}-${var.service_name}-"
  resource_identifier  = lower(local._resource_identifier)
  _asg_tags = [
    {
      "key"                 = "kubernetes.io/cluster/${var.cluster_name}"
      "value"               = "owned"
      "propagate_at_launch" = true
    },
    {
      "key"                 = "k8s.io/cluster-autoscaler/${var.cluster_name}"
      "value"               = "owned"
      "propagate_at_launch" = false
    },
    {
      "key"                 = "k8s.io/cluster-autoscaler/${var.cluster_autoscaler_enabled ? "enabled" : "disabled"}"
      "value"               = "true"
      "propagate_at_launch" = false
    },
    {
      "key"                 = "k8s.io/cluster-autoscaler/node-template/label/eks.moengage.io/namespace"
      "value"               = var.kubernetes_namespace
      "propagate_at_launch" = false
    },
    {
      "key"                 = "k8s.io/cluster-autoscaler/node-template/label/eks.moengage.io/service"
      "value"               = var.fab_tag
      "propagate_at_launch" = false
    }
  ]

  asg_tags = concat(local._asg_tags, var.extra_asg_tags)

}

