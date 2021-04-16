variable "tg_name"{
    type = string
    description = "The Target Group Name"
}
variable "alarm_actions"{
    type = list
    description = "The Alarm actions arn in list"
}
variable "dimensions_LoadBalancer"{
    type = string
    description = "LoadBalancer ARN suffix"
}
variable "dimensions_TargetGroup"{
    type = string
    description = "Target Group ARN suffix"
}