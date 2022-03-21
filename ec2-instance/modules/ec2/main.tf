resource "aws_instance" "instance" {
  ami                    = var.ami
  instance_type          = var.instance_size
  user_data              = "${file("${path.module}/user_data.sh")}"
  vpc_security_group_ids = var.security_groups
  key_name               = var.key_name

  tags = {
    Name = "${var.project_name}"
  }
}