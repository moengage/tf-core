output "launched_instance" {
  value = aws_instance.ec2.*.id
}
