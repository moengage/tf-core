output "id" {
  description = "List of IDs of instances"
  value       = join(",", aws_instance.ec2.*.id)
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = join(",", aws_instance.ec2.*.private_ip)
}
