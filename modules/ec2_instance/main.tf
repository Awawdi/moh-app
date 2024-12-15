resource "aws_instance" "ec2_instance" {
  count          = var.instance_count
  ami            = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = true
  key_name       = "my-TF-KP"
    tags = {
        Name = "${var.instance_name}-${var.module_count}"
    }
  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }

  user_data = templatefile("${path.module}/init-script.sh", {
    DOCKER_IMAGE = var.docker_image
  })
}
