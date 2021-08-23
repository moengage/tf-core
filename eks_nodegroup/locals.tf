locals {
  _architecture_suffix = {
    "arm64"             = "-arm64",
    "amd64"             = "",
    "amd64-accelerated" = "-gpu"
  }
  _service              = lower(var.service_name)
  _subservice           = lower(var.subservice_name)
  _instance_group       = lower(var.instance_group)
  _kubernetes_namespace = var.kubernetes_namespace == "default" ? var.business_name : var.kubernetes_namespace
  _lifecycle            = var.on_demand_percentage_above_base_capacity == 100 ? "ondemand" : "spot"

  default_tags = {
    ManagedBy     = "terraform"
    Region        = data.aws_region.current.name
    CreatedBy     = lower(var.created_by)
    Environment   = lower(var.environment)
    Business      = lower(var.business_name)
    Service       = local._service
    SubService    = local._subservice
    K8SCluster    = lower(var.cluster_name)
    InstanceGroup = local._instance_group
    Lifecycle     = local._lifecycle
  }

  _resource_identifier = "${var.business_name}-${local._service}-${local._subservice}-${local._instance_group}-${local._lifecycle}"
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
      "value"               = local._kubernetes_namespace
      "propagate_at_launch" = false
    },
    {
      "key"                 = "k8s.io/cluster-autoscaler/node-template/label/eks.moengage.io/service"
      "value"               = local._service
      "propagate_at_launch" = false
    },
    {
      "key"                 = "k8s.io/cluster-autoscaler/node-template/label/eks.moengage.io/subservice"
      "value"               = local._subservice
      "propagate_at_launch" = false
    },
    {
      "key"                 = "k8s.io/cluster-autoscaler/node-template/label/eks.moengage.io/instancegroup"
      "value"               = local._instance_group
      "propagate_at_launch" = false
    },
    {
      "key"                 = "k8s.io/cluster-autoscaler/node-template/label/eks.moengage.io/lifecycle"
      "value"               = local._lifecycle
      "propagate_at_launch" = false
    }
  ]

  asg_tags = concat(local._asg_tags, var.extra_asg_tags)

  bootstrap_extra_args = coalesce(var.bootstrap_extra_args, "--node-labels=eks.moengage.io/namespace=${local._kubernetes_namespace},eks.moengage.io/lifecycle=${local._lifecycle},eks.moengage.io/service=${local._service},eks.moengage.io/subservice=${local._subservice},eks.moengage.io/instancegroup=${local._instance_group}")

}

