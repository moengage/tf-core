resource "random_id" "iam_instance_profile_id" {
  keepers = {
    name = local.resource_identifier
  }

  byte_length = 4
}

resource "aws_iam_instance_profile" "default" {
  name = "${local.resource_identifier}-${random_id.iam_instance_profile_id.hex}-instance-role"
  role = data.aws_iam_role.default.name
}

module "nodegroup" {
  source                                   = "../../tf-core/autoscaling_with_launch_template/"
  associate_public_ip_address              = var.associate_public_ip_address
  business_name                            = var.business_name
  created_by                               = var.created_by
  default_cooldown                         = var.default_cooldown
  desired_capacity                         = var.desired_capacity
  environment                              = var.environment
  health_check_type                        = var.health_check_type
  iam_instance_profile                     = aws_iam_instance_profile.default.arn
  image_id                                 = coalesce(var.image_id, data.aws_ssm_parameter.default.value)
  instance_subnet_ids                      = var.instance_subnet_ids
  instance_security_group_ids              = [data.aws_security_group.default.id]
  key_name                                 = var.key_name
  max_size                                 = var.max_size
  min_size                                 = var.min_size
  on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
  instance_types                           = var.instance_types
  service_name                             = var.service_name
  volume_size                              = var.volume_size
  vpc_id                                   = var.vpc_id
  user_data                                = data.template_file.userdata.rendered
  target_group_arns                        = var.target_group_arns
  extra_asg_tags = [
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
  ]
}

