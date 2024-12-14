module "vpc1" {
  source             = "./modules/vpc"
  aws_region         = var.aws_region
  vpc_cidr_block     = var.vpc1_cidr_block
  subnet_cidr_block  = var.vpc1_subnet_cidr_block
  availability_zone  = var.vpc1_availability_zone
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  public_key_file    = data.aws_key_pair.existing_key.public_key
}

module "vpc2" {
  source             = "./modules/vpc"
  aws_region         = var.aws_region
  vpc_cidr_block     = var.vpc2_cidr_block
  subnet_cidr_block  = var.vpc2_subnet_cidr_block
  availability_zone  = var.vpc2_availability_zone
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  public_key_file    = var.public_key_file

  count = var.create_vpc2 ? 1 : 0
}

data "aws_key_pair" "existing_key" {
  key_name = "tf-kp"
}