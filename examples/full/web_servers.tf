module "web_server_blue_1" {
  source  = "app.terraform.io/fer1035/ec2-instance/aws"
  version = "1.0.6"

  providers = {
    aws = aws.blue_server
  }

  security_groups = [module.security_group_web.security_group_id, module.security_group_ssh.security_group_id]
  subnet          = module.network.public_subnet_1
  ami             = "ami-090e0fc566929d98b"

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCFnY0iy1WvUoUaVmFINDrcMgt+CePecYEbnaFetbn3GK47cJv19WdHtxH611Z/UE2RKNFIpcpiFIZzugfjdqf9BIs1kS1f2bmtDlgDPGUrmwRnea4BlgVUA6f3T4vlLBXvD1CBYeZJiAM22wdehzpsn0ydICpisL10LKrSUBuYvtLuT8ST3atFaKWwVrzWkNxxmXgZgRPhoAwxCIsklIhaDAQgRJ/ZEOqy1lmNCHdKhnmHz+4hxXjBnmgAcDvD9YX9oQa4sSkEC4nny11p4M8z/6KrD4zYgb21YUKf4CzbXYWfEyaEOGbTSOyXgfy2l7Z3g78xQX2hr86OvqTxOx1r WLWeb"

  user_data = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd
echo "Blue"  > /var/www/html/index.html
EOF
}

module "web_server_blue_2" {
  source  = "app.terraform.io/fer1035/ec2-instance/aws"
  version = "1.0.6"

  providers = {
    aws = aws.blue_server
  }

  security_groups = [module.security_group_web.security_group_id, module.security_group_ssh.security_group_id]
  subnet          = module.network.public_subnet_1
  ami             = "ami-090e0fc566929d98b"

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCFnY0iy1WvUoUaVmFINDrcMgt+CePecYEbnaFetbn3GK47cJv19WdHtxH611Z/UE2RKNFIpcpiFIZzugfjdqf9BIs1kS1f2bmtDlgDPGUrmwRnea4BlgVUA6f3T4vlLBXvD1CBYeZJiAM22wdehzpsn0ydICpisL10LKrSUBuYvtLuT8ST3atFaKWwVrzWkNxxmXgZgRPhoAwxCIsklIhaDAQgRJ/ZEOqy1lmNCHdKhnmHz+4hxXjBnmgAcDvD9YX9oQa4sSkEC4nny11p4M8z/6KrD4zYgb21YUKf4CzbXYWfEyaEOGbTSOyXgfy2l7Z3g78xQX2hr86OvqTxOx1r WLWeb"

  user_data = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd
echo "Blue"  > /var/www/html/index.html
EOF
}

module "web_server_green_1" {
  source  = "app.terraform.io/fer1035/ec2-instance/aws"
  version = "1.0.6"

  providers = {
    aws = aws.green_server
  }

  security_groups = [module.security_group_web.security_group_id, module.security_group_ssh.security_group_id]
  subnet          = module.network.public_subnet_2
  ami             = "ami-090e0fc566929d98b"

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCFnY0iy1WvUoUaVmFINDrcMgt+CePecYEbnaFetbn3GK47cJv19WdHtxH611Z/UE2RKNFIpcpiFIZzugfjdqf9BIs1kS1f2bmtDlgDPGUrmwRnea4BlgVUA6f3T4vlLBXvD1CBYeZJiAM22wdehzpsn0ydICpisL10LKrSUBuYvtLuT8ST3atFaKWwVrzWkNxxmXgZgRPhoAwxCIsklIhaDAQgRJ/ZEOqy1lmNCHdKhnmHz+4hxXjBnmgAcDvD9YX9oQa4sSkEC4nny11p4M8z/6KrD4zYgb21YUKf4CzbXYWfEyaEOGbTSOyXgfy2l7Z3g78xQX2hr86OvqTxOx1r WLWeb"

  user_data = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd
echo "Green"  > /var/www/html/index.html
EOF
}

module "web_server_green_2" {
  source  = "app.terraform.io/fer1035/ec2-instance/aws"
  version = "1.0.6"

  providers = {
    aws = aws.green_server
  }

  security_groups = [module.security_group_web.security_group_id, module.security_group_ssh.security_group_id]
  subnet          = module.network.public_subnet_2
  ami             = "ami-090e0fc566929d98b"

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCFnY0iy1WvUoUaVmFINDrcMgt+CePecYEbnaFetbn3GK47cJv19WdHtxH611Z/UE2RKNFIpcpiFIZzugfjdqf9BIs1kS1f2bmtDlgDPGUrmwRnea4BlgVUA6f3T4vlLBXvD1CBYeZJiAM22wdehzpsn0ydICpisL10LKrSUBuYvtLuT8ST3atFaKWwVrzWkNxxmXgZgRPhoAwxCIsklIhaDAQgRJ/ZEOqy1lmNCHdKhnmHz+4hxXjBnmgAcDvD9YX9oQa4sSkEC4nny11p4M8z/6KrD4zYgb21YUKf4CzbXYWfEyaEOGbTSOyXgfy2l7Z3g78xQX2hr86OvqTxOx1r WLWeb"

  user_data = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd
echo "Green"  > /var/www/html/index.html
EOF
}
