locals {
  _subservice_name = coalesce(var.subservice_name, var.service_name)
  _architecture_suffix = {
    "arm64"             = "-arm64",
    "amd64"             = "",
    "amd64-accelerated" = "-gpu"
  }

  default_tags = {
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
    CreatedBy   = lower(var.created_by)
    Environment = lower(var.environment)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
    SubService  = lower(local._subservice_name)
  }

  _resource_identifier = "${var.business_name}-${var.service_name}-"
  resource_identifier  = lower(local._resource_identifier)

  _lifecycle = var.on_demand_percentage_above_base_capacity == 100 ? "ondemand" : "spot"
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
      "value"               = var.service_name
      "propagate_at_launch" = false
    },
    {
      "key"                 = "k8s.io/cluster-autoscaler/node-template/label/eks.moengage.io/lifecycle"
      "value"               = local._lifecycle
      "propagate_at_launch" = false
    }
  ]

  asg_tags = concat(local._asg_tags, var.extra_asg_tags)

  bootstrap_extra_args = coalesce(var.bootstrap_extra_args, "--node-labels=eks.moengage.io/namespace=${var.kubernetes_namespace},eks.moengage.io/lifecycle=${local._lifecycle}")

}

