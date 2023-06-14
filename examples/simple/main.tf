module "blue_green" {
  source = "app.terraform.io/my-org/blue-green-canary/tfe"

  vpc_id          = "vpc-askj2131jbb2jk3h1bj"
  subnet_ids      = ["subnet-askljhkl345634", "subnet-iluhkj67nk57n"]
  sg_ids          = ["sg-kjhjkln6k75nk"]
  blue_target_id  = "i-lkjhkl4353nb53jk4"
  green_target_id = "i-lkjasd9o8y34k5jn3"

  traffic_distribution = "blue-90"
}

output "deployment" {
  value = module.blue_green
}
