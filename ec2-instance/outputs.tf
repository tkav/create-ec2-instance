output "instance_public_dns" {
  value = module.instance.public_dns
}

output "ssh_info" {
  value = "ssh -i ~/.ssh/${var.key_name}.pem ec2-user@${module.instance.public_dns}"
}
