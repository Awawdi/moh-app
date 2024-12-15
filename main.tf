module "vpc1" {
  source             = "./modules/vpc"
  aws_region         = var.aws_region
  vpc_cidr_block     = var.vpc1_cidr_block
  subnet_cidr_block  = var.vpc1_subnet_cidr_block
  availability_zone  = var.vpc1_availability_zone
  public_key_file    = data.aws_key_pair.existing_key.public_key
}

module "vpc2" {
  source             = "./modules/vpc"
  aws_region         = var.aws_region
  vpc_cidr_block     = var.vpc2_cidr_block
  subnet_cidr_block  = var.vpc2_subnet_cidr_block
  availability_zone  = var.vpc2_availability_zone
  public_key_file    = data.aws_key_pair.existing_key.public_key

  count = var.create_vpc2 ? 1 : 0
}

module "blue_instance" {
  source              = "./modules/ec2_instance"
  count               = var.blue_instance_count
  instance_count      = 1
  subnet_id           = module.vpc1.subnet_id
  security_group_ids  = [module.vpc1.security_group_id]
  docker_image        = var.blue_docker_image
  instance_name           = "blue_instance"
  module_count        = count.index
}

module "green_instance" {
  source              = "./modules/ec2_instance"
  count               = var.green_instance_count
  instance_count      = 1
  subnet_id           = module.vpc1.subnet_id
  security_group_ids  = [module.vpc1.security_group_id]
  docker_image        = var.green_docker_image
  instance_name       = "green_instance"
  module_count        = count.index
}


data "aws_key_pair" "existing_key" {
  key_name = "tf-kp"
}