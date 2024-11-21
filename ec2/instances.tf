resource "aws_instance" "ec2" {
  count                       = var.ec2_instance_count
  ami                         = var.ami_id
  availability_zone           = element(var.availability_zones, length(var.availability_zones) % var.ec2_instance_count)
  instance_type               = var.instance_type
  key_name                    = var.instance_keyname
  vpc_security_group_ids      = var.security_group_ids
  subnet_id                   = element(var.subnet_ids, length(var.subnet_ids) % var.ec2_instance_count)
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = var.iam_instance_profile
  user_data                   = var.user_data

  root_block_device {
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
    encrypted   = var.aws_ebs_default_kms_key != "" ? true : false
    kms_key_id  = var.aws_ebs_default_kms_key
    tags = merge(
      local.default_tags,
      map("Name", "${local.resource_identifier}-root-${count.index + 1}"),
      var.extra_instance_tags,
    )
  }

  tags = merge(
    local.default_tags,
    map("Name", "${local.resource_identifier}-${count.index + 1}"),
    var.extra_instance_tags
  )
}

resource "aws_ebs_volume" "ebs_volume" {
  count             = var.ec2_instance_count * var.ebs_volume_count
  availability_zone = element(aws_instance.ec2.*.availability_zone, count.index)
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type
  iops              = var.ebs_volume_type == "gp3" ? var.data_disk_iops : null
  throughput        = var.ebs_volume_type == "gp3" ? var.data_disk_throughput : null
  encrypted         = var.aws_ebs_default_kms_key != "" ? true : false
  kms_key_id        = var.aws_ebs_default_kms_key
  snapshot_id       = var.aws_ebs_snapshot_id
  tags = merge(
    local.default_tags,
    map("Name", "${local.resource_identifier}-ebs-${(count.index) % var.ebs_volume_count + 1}"),
    var.extra_instance_tags
  )
}

resource "aws_volume_attachment" "volume_attachement" {
  count       = var.ec2_instance_count * var.ebs_volume_count
  volume_id   = aws_ebs_volume.ebs_volume.*.id[count.index]
  instance_id = element(aws_instance.ec2.*.id, count.index)
  device_name = element(var.ec2_device_names, count.index)
}
