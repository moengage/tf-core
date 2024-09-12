resource "aws_launch_template" "default" {
  name          = "${local.resource_identifier}-lt"
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
      volume_type = var.volume_type
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
    security_groups             = var.instance_security_group_ids
    delete_on_termination       = var.delete_network_interfaces_on_termination
  }

  tags = merge(local.default_tags)
}

