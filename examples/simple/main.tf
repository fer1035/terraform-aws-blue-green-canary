terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "blue_green" {
  source = "app.terraform.io/my-org/blue-green-canary/tfe"

  vpc_id          = "vpc-askj2131jbb2jk3h1bj"
  subnet_ids      = ["subnet-askljhkl345634", "subnet-iluhkj67nk57n"]
  sg_ids          = ["sg-kjhjkln6k75nk"]

  targets = {
    blue  = {
      id   = "i-lkjhkl4353nb53jk4"
      port = 80
    }
    green = {
      id   = "i-lkjasd9o8y34k5jn3"
      port = 80
    }
  }

  traffic_distribution = "blue-90"
}

output "deployment" {
  value = module.blue_green
}
