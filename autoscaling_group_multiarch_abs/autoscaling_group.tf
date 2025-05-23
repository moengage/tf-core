resource "aws_autoscaling_group" "default" {
  name                      = "${local.resource_identifier}-asg"
  count                     = var.enabled ? 1 : 0
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  default_cooldown          = var.default_cooldown
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  vpc_zone_identifier       = var.instance_subnet_ids
  target_group_arns         = var.target_group_arns
  termination_policies      = var.termination_policies
  enabled_metrics           = var.enabled_metrics
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  metrics_granularity       = var.metrics_granularity
  suspended_processes       = var.suspended_processes
  min_elb_capacity          = var.min_elb_capacity
  wait_for_elb_capacity     = var.wait_for_elb_capacity
  protect_from_scale_in     = var.protect_from_scale_in
  capacity_rebalance        = var.capacity_rebalance

  dynamic "initial_lifecycle_hook" {
    for_each = var.initial_lifecycle_hooks
    content {
      name                 = initial_lifecycle_hook.value.name
      default_result       = lookup(initial_lifecycle_hook.value, "default_result", null)
      heartbeat_timeout    = lookup(initial_lifecycle_hook.value, "heartbeat_timeout", null)
      lifecycle_transition = initial_lifecycle_hook.value.lifecycle_transition
    }
  }

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = var.arm_launch_template_id
        version            = var.launch_template_version
      }

      override {
        instance_requirements {
          burstable_performance = local.burstable_performance_value
          excluded_instance_types = var.arm_excluded_instance_types
          instance_generations = var.instance_generations
          memory_mib {
            min = var.memory_mib
            max = 4*(var.memory_mib)
          }
          vcpu_count {
            min = var.vcpu_count
            max = 2*(var.vcpu_count)
          }
          cpu_manufacturers = var.arm_cpu_manufacturers_value
        }
      }

      override {
        launch_template_specification {
          launch_template_id = var.amd_launch_template_id
          version            = var.launch_template_version
        }

        instance_requirements {
          burstable_performance = local.burstable_performance_value
          excluded_instance_types = var.amd_excluded_instance_types
          instance_generations = var.instance_generations
          memory_mib {
            min = var.memory_mib
            max = 4*(var.memory_mib)
          }
          vcpu_count {
            min = var.vcpu_count
            max = 2*(var.vcpu_count)
          }
          cpu_manufacturers = var.amd_cpu_manufacturers_value
        }

      }

    }
    instances_distribution {
      on_demand_allocation_strategy            = var.on_demand_allocation_strategy
      on_demand_base_capacity                  = var.on_demand_base_capacity
      on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
      spot_allocation_strategy                 = var.spot_allocation_strategy
      spot_instance_pools                      = var.spot_instance_pools
      spot_max_price                           = var.spot_max_price
    }
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [desired_capacity]
  }

  tags = local.asg_tags
}

