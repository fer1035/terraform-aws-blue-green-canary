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

  default_tags {
    tags = {
      Name = "BlueGreen"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "blue_server"

  default_tags {
    tags = {
      Name = "BlueServer"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "green_server"

  default_tags {
    tags = {
      Name = "GreenServer"
    }
  }
}
