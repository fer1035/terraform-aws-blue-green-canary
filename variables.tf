variable "vpc_id" {
  type        = string
  description = "VPC for deployment."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of Subnets for the ALB."
}

variable "sg_ids" {
  type        = list(string)
  description = "List of Security Groups for the ALB."
}

variable "internal" {
  type        = bool
  description = "Whether the ALB is internal-facing (Private)."
  default     = false
}

variable "port" {
  type        = number
  description = "Listener and Target Group port."
  default     = 80
}

variable "protocol" {
  type        = string
  description = "Listener and Target Group protocol."
  default     = "HTTP"
}

variable "ssl_policy" {
  type        = string
  description = "SSL policy to use with the HTTPS listener. The latest value during the publication of this module version is \"ELBSecurityPolicy-TLS13-1-2-2021-06\"."
  default     = null
}

variable "ssl_certificate_arn" {
  type        = string
  description = "The certificate ARN to use with the HTTPS listener"
  default     = null
}

variable "target_healthcheck_timeout" {
  type        = number
  description = "Target Group health check timeout in seconds."
  default     = 5
}

variable "target_healthcheck_interval" {
  type        = number
  description = "Target Group health check interval in seconds."
  default     = 10
}

variable "targets" {
  type        = map(any)
  description = "Blue and Green target details for a simple deployment."

  default = {
    blue = {
      id   = null
      port = null
    }
    green = {
      id   = null
      port = null
    }
  }
}

variable "traffic_distribution" {
  type        = string
  description = "Levels of traffic distribution"
}

locals {
  traffic_dist_map = {
    blue-100 = {
      blue  = 100
      green = 0
    }
    blue-90 = {
      blue  = 90
      green = 10
    }
    blue-80 = {
      blue  = 80
      green = 20
    }
    blue-70 = {
      blue  = 70
      green = 30
    }
    blue-60 = {
      blue  = 60
      green = 40
    }
    blue-50 = {
      blue  = 50
      green = 50
    }
    blue-40 = {
      blue  = 40
      green = 60
    }
    blue-30 = {
      blue  = 30
      green = 70
    }
    blue-20 = {
      blue  = 20
      green = 80
    }
    blue-10 = {
      blue  = 10
      green = 90
    }
    blue-0 = {
      blue  = 0
      green = 100
    }
  }
}
