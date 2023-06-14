module "blue_green" {
  source  = "app.terraform.io/my-org/blue-green-canary/tfe"
  version = "1.0.1"

  vpc_id                      = "vpc-askj2131jbb2jk3h1bj"
  subnet_ids                  = ["subnet-askljhkl345634", "subnet-iluhkj67nk57n"]
  sg_ids                      = ["sg-kjhjkln6k75nk"]
  internal                    = false
  port                        = 443
  protocol                    = "HTTPS"
  ssl_policy                  = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  ssl_certificate_arn         = "arn:aws:iam::123456789012:server-certificate/my_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  target_healthcheck_timeout  = 5
  target_healthcheck_interval = 10
  blue_target_id              = "i-lkjhkl4353nb53jk4"
  green_target_id             = "i-lkjasd9o8y34k5jn3"

  traffic_distribution = "blue-90"
}

output "deployment" {
  value = module.blue_green
}
