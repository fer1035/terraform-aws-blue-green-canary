module "security_group_web" {
  source  = "app.terraform.io/fer1035/security-group/aws"
  version = "1.0.2"

  ingress_from     = 80
  ingress_to       = 80
  ingress_cidr     = "0.0.0.0/0"
  ingress_protocol = "tcp"
  sg_description   = "Web server port."
  vpc_id           = module.network.vpc_id
}

module "security_group_ssh" {
  source  = "app.terraform.io/fer1035/security-group/aws"
  version = "1.0.2"

  ingress_from     = 22
  ingress_to       = 22
  ingress_cidr     = "0.0.0.0/0"
  ingress_protocol = "tcp"
  sg_description   = "SSH port."
  vpc_id           = module.network.vpc_id
}
