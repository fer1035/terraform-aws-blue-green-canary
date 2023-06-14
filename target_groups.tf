resource "aws_lb_target_group" "blue" {
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id

  health_check {
    port     = var.port
    protocol = var.protocol
    timeout  = var.target_healthcheck_timeout
    interval = var.target_healthcheck_interval
  }
}

resource "aws_lb_target_group_attachment" "blue" {
  target_group_arn = aws_lb_target_group.blue.arn
  target_id        = var.blue_target_id
  port             = var.port
}

resource "aws_lb_target_group" "green" {
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id

  health_check {
    port     = var.port
    protocol = var.protocol
    timeout  = var.target_healthcheck_timeout
    interval = var.target_healthcheck_interval
  }
}

resource "aws_lb_target_group_attachment" "green" {
  target_group_arn = aws_lb_target_group.green.arn
  target_id        = var.green_target_id
  port             = var.port
}
