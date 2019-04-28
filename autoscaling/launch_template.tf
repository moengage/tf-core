resource "aws_launch_template" "default" {
  name = "${local.resource_identifier}-lt"

  block_device_mappings {
    device_name = "${var.device_name}"

    ebs = {
      volume_size = "${var.volume_size}"
    }
  }

  ebs_optimized = "${var.ebs_optimized}"

  iam_instance_profile = "${var.iam_instance_profile}"

  image_id = "${var.image_id}"

  key_name = "${var.key_name}"

  monitoring {
    enabled = "${var.monitoring_enabled}"
  }

  network_interfaces {
    associate_public_ip_address = "${var.associate_public_ip_address}"
    security_groups             = ["${concat(list(aws_security_group.instances.id), var.instance_security_group_ids)}"]
  }

  #vpc_security_group_ids = ["${concat(list(aws_security_group.instances.id), var.instance_security_group_ids)}"]

  tag_specifications {
    resource_type = "instance"

    tags = "${merge(
      local.default_tags,
      var.extra_instance_tags,
    )}"
  }
  tag_specifications {
    resource_type = "volume"

    tags = "${merge(
      local.default_tags,
      var.extra_volume_tags,
    )}"
  }
  tags = "${merge(
    local.default_tags,
  )}"
}
