resource "aws_lb" "alb" {
  internal           = var.internal
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = var.sg_ids
}
