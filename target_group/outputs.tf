output "arn" {
  value = "${aws_lb_target_group.tg.arn}"
}

output "arn_suffix" {
  value = "${aws_lb_target_group.tg.arn_suffix}"
}

output "name" {
  value = "${aws_lb_target_group.tg.name}"
}
