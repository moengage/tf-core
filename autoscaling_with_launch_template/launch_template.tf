resource "aws_launch_template" "default" {
  name          = "${coalesce(var.alternate_resource_name, join("-", [local.resource_identifier, "lt"]))}"
  ebs_optimized = var.ebs_optimized
  image_id      = var.image_id
  key_name      = var.key_name
  user_data     = base64encode(var.user_data)

  iam_instance_profile {
    arn = var.iam_instance_profile
  }

  block_device_mappings {
    device_name = var.device_name

    ebs {
      volume_size = var.volume_size
    }
  }

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  monitoring {
    enabled = var.monitoring_enabled
  }

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
    security_groups = concat(
      [aws_security_group.instances.id],
      var.instance_security_group_ids,
    )
    delete_on_termination = var.delete_network_interfaces_on_termination
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      local.default_tags,
      local.asg_managed_name_tag,
      var.extra_instance_tags,
    )
  }

  tag_specifications {
    resource_type = "volume"

    tags = merge(
      local.default_tags,
      local.asg_managed_name_tag,
      var.extra_volume_tags,
    )
  }

  tags = merge(local.default_tags)
}

