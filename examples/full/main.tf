module "blue_green" {
  source  = "app.terraform.io/fer1035/blue-green-canary/aws"
  version = "1.1.7"

  vpc_id                      = module.network.vpc_id
  subnet_ids                  = [module.network.public_subnet_1, module.network.public_subnet_2]
  sg_ids                      = [module.security_group_web.security_group_id]
  internal                    = false
  port                        = 80
  protocol                    = "HTTP"
  ssl_policy                  = null
  ssl_certificate_arn         = null
  target_healthcheck_timeout  = 5
  target_healthcheck_interval = 10

  traffic_distribution = "blue-90"
}

resource "aws_lb_target_group_attachment" "blue_1" {
  target_group_arn = module.blue_green.blue_target_group.arn
  target_id        = element(split("/", module.web_server_blue_1.instance_arn), 1)
  port             = 80
}

resource "aws_lb_target_group_attachment" "blue_2" {
  target_group_arn = module.blue_green.blue_target_group.arn
  target_id        = element(split("/", module.web_server_blue_2.instance_arn), 1)
  port             = 80
}

resource "aws_lb_target_group_attachment" "green_1" {
  target_group_arn = module.blue_green.green_target_group.arn
  target_id        = element(split("/", module.web_server_green_1.instance_arn), 1)
  port             = 80
}

resource "aws_lb_target_group_attachment" "green_2" {
  target_group_arn = module.blue_green.green_target_group.arn
  target_id        = element(split("/", module.web_server_green_2.instance_arn), 1)
  port             = 80
}

output "deployment" {
  value = module.blue_green
}
