locals {

  cpu_manufacturers_value        = lookup(var.cpu_manufacturers, var.arch_type, [])
  excluded_instance_types_value  = lookup(var.excluded_instance_types, var.arch_type, [])
  burstable_performance_value    = lookup(var.burstable_performance, var.arch_type, "")

  _subservice_name     = coalesce(var.subservice_name, var.service_name)
  _resource_identifier = "${var.business_name}-${var.service_name}-${local._subservice_name}-${var.arch_type}"
  resource_identifier  = coalesce(var.asg_name, lower(local._resource_identifier))

  iam_resource_identifier = "${lower(local._resource_identifier)}-${data.aws_region.current.name}"
  iam_resource_path       = "/${replace(local.iam_resource_identifier, "-", "/")}/"

  default_tags = {
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.name
    CreatedBy   = lower(var.created_by)
    Cluster     = lower(var.cluster)
    Environment = lower(var.environment)
    Business    = lower(var.business_name)
    Service     = lower(var.service_name)
    SubService  = lower(local._subservice_name)
    FabTag      = var.fab_tag
  }

  _asg_tags = [
    {
      "key"                 = "Business"
      "value"               = lower(var.business_name)
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "Service"
      "value"               = lower(var.service_name)
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "SubService"
      "value"               = lower(local._subservice_name)
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "Environment"
      "value"               = lower(var.environment)
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "FabTag"
      "value"               = var.fab_tag
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "Cluster"
      "value"               = lower(var.cluster)
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "ManagedBy"
      "value"               = "terraform"
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "Name"
      "value"               = local.resource_identifier
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "CreatedBy"
      "value"               = var.created_by
      "propagate_at_launch" = var.propagate_tags_at_launch
    },
    {
      "key"                 = "cost_tracking"
      "value"               = "enabled"
      "propagate_at_launch" = true
    },
    {
      "key"                 = "arch_type"
      "value"               = var.arch_type
      "propagate_at_launch" = true
    },
  ]

  asg_tags = concat(local._asg_tags, var.extra_asg_tags)

  asg_managed_name_tag = {
    Name = local.resource_identifier
  }

  mixed_instances_policy_without_multiarch = {
    launch_template = {
      launch_template_specification = {
        launch_template_id = var.launch_template_id
        version            = var.launch_template_version
      }
      override = [
        {
          instance_requirements = {
            burstable_performance     = local.burstable_performance_value
            excluded_instance_types   = local.excluded_instance_types_value
            instance_generations      = var.instance_generations
            memory_mib = {
              min = var.memory_mib
              max = 4 * var.memory_mib
            }
            vcpu_count = {
              min = var.vcpu_count
              max = 2 * var.vcpu_count
            }
            cpu_manufacturers = local.cpu_manufacturers_value
          }
        }
      ]
    }

    instances_distribution = {
      on_demand_allocation_strategy            = var.on_demand_allocation_strategy
      on_demand_base_capacity                  = var.on_demand_base_capacity
      on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
      spot_allocation_strategy                 = var.spot_allocation_strategy
      spot_instance_pools                      = var.spot_instance_pools
      spot_max_price                           = var.spot_max_price
    }
  }

  mixed_instances_policy_with_multiarch = {
    launch_template = {
      launch_template_specification = {
        launch_template_id = var.arm_launch_template_id
        version            = var.launch_template_version
      }
      override = [
        {
          instance_requirements = {
            burstable_performance     = local.burstable_performance_value
            excluded_instance_types   = var.arm_excluded_instance_types
            instance_generations      = var.instance_generations
            memory_mib = {
              min = var.memory_mib
              max = 4 * var.memory_mib
            }
            vcpu_count = {
              min = var.vcpu_count
              max = 2 * var.vcpu_count
            }
            cpu_manufacturers = var.arm_cpu_manufacturers_value
          }
        },
        {
          launch_template_specification = {
            launch_template_id = var.amd_launch_template_id
            version            = var.launch_template_version
          }
          instance_requirements = {
            burstable_performance     = local.burstable_performance_value
            excluded_instance_types   = var.amd_excluded_instance_types
            instance_generations      = var.instance_generations
            memory_mib = {
              min = var.memory_mib
              max = 4 * var.memory_mib
            }
            vcpu_count = {
              min = var.vcpu_count
              max = 2 * var.vcpu_count
            }
            cpu_manufacturers = var.amd_cpu_manufacturers_value
          }
        }
      ]
    }
    instances_distribution = {
      on_demand_allocation_strategy            = var.on_demand_allocation_strategy
      on_demand_base_capacity                  = var.on_demand_base_capacity
      on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
      spot_allocation_strategy                 = var.spot_allocation_strategy
      spot_instance_pools                      = var.spot_instance_pools
      spot_max_price                           = var.spot_max_price
    }
  }
}


