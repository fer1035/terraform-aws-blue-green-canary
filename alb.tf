resource "aws_lb" "alb" {
  #tfsec:ignore:aws-elb-alb-not-public
  internal                   = var.internal
  load_balancer_type         = "application"
  subnets                    = var.subnet_ids
  security_groups            = var.sg_ids
  drop_invalid_header_fields = true
}
