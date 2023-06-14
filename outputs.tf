output "alb" {
  value = aws_lb.alb
}

output "listener" {
  value = aws_lb_listener.listener
}

output "blue_target_group" {
  value = aws_lb_target_group.blue
}

output "green_target_group" {
  value = aws_lb_target_group.green
}

output "canary_test_command" {
  value = "for i in `seq 1 100`; do curl '${lower(var.protocol)}://${aws_lb.alb.dns_name}:${var.port}'; done"
}
