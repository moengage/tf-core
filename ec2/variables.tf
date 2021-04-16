variable "created_by" {
  description = "A maintainer tag will be added to aws launched resources"
}

variable "environment" {
  description = "An environment tag will be used on aws resources"
}

variable "business_name" {
  description = "A Business tag will be used on aws resources for costs calculation"
}

variable "service_name" {
  description = "Service name will be used in DNS, naming resources, costs calculation etc, "
}

variable "subservice_name" {
  description = "SubService name will be used in DNS, naming resources etc,"
}

variable "ec2_instance_count" {
  description = "the numbers of EC2 instances to be launched"
}

variable "availability_zones" {
  description = "AWS Availability zones where instances should be launched"
  type        = list(string)
}

variable "instance_type" {
  description = "AWS Instance Type for the instance - eg c6g.xlarge/m5.2xlarge"
}

variable "instance_keyname" {
  description = "SSH KeyPair name for this instance"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group ids to be assigned to this instance"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets where this instance can be launched"
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP to this instance"
}

variable "root_volume_type" {
  description = "Root Disk Volume Type - Allowed values = gp2/gp3/st1"
  default     = "gp3"
}

variable "root_volume_size" {
  description = "Size of the Root Disk Volume"
  default     = 20
}

variable "ebs_volume_size" {
  description = "Disk Volume Size for all ebs attached disks"
  default     = 20
}

variable "ebs_volume_type" {
  description = ""
  default     = "gp3"
}

variable "ebs_volume_count" {
  description = "No of EBS volumes to be attached per instance"
  default     = 0
}

variable "ami_id" {
  description = "AMI ID to use for launching this instance"
}

variable "iam_instance_profile" {
  description = "IAM role for this instance"
  default     = ""
}

variable "extra_instance_tags" {
  type        = map(string)
  description = "Extra tags for instances to be launched in ASG"
  default     = {}
}

variable "ec2_device_names" {
  type        = list(string)
  description = "Name of the EBS device to mount"
  default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]
}
