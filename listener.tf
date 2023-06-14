resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.port
  #tfsec:ignore:aws-elb-http-not-used
  protocol        = var.protocol
  ssl_policy      = var.ssl_policy
  certificate_arn = var.ssl_certificate_arn

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.blue.arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "blue", 100)
      }

      target_group {
        arn    = aws_lb_target_group.green.arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "green", 0)
      }

      stickiness {
        enabled  = false
        duration = 1
      }
    }
  }
}
