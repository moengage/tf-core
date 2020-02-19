variable cluster {
  description = "Cluster Name"
}

variable created_by {
  description = "Created By"
}

variable environment {
  description = "Environment"
}

variable vpc_id {
  description = "VPC ID"
}

variable resource_type {
  description = "Resource Type (public/private/cluster)"
}

variable resource_group {
  description = "Resource Group (service name)"
}

variable create_before_destroy {
  type        = bool
  default     = true
  description = "Create SG before destroying"
}

variable sg_description {
  description = "The security group description"
}

variable allow_all_egress {
  type        = bool
  default     = true
  description = "Add an allow all egress rule to the SG"
}
