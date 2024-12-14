resource "aws_instance" "green_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc1.subnet_id
  vpc_security_group_ids = [module.vpc1.security_group_id]
  associate_public_ip_address = true
  key_name      = "my-TF-KP"
  tags = {
    Name = "green_instance"
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }

  user_data = templatefile("${path.module}/init-script.sh", {
  DOCKER_IMAGE = var.docker_image_green
  })

}
