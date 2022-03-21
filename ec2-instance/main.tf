
module "instance_security_group" {
  source = "./modules/security_group"

  project_name = var.project_name
}

module "instance" {
  source = "./modules/ec2"

  ami             = "ami-0646b10ec20a40c81"
  key_name        = var.key_name
  instance_size   = "t3.micro"
  project_name    = var.project_name
  security_groups = [module.instance_security_group.security_group_id]
}