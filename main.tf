terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

module "vpc_1" {
  source             = "./modules/vpc"
  aws_region         = var.aws_region
  vpc_cidr_block     = var.vpc_cidr_block_1
  subnet_cidr_block  = var.subnet_cidr_block_1
  availability_zone  = var.availability_zone_1
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  public_key_file    = var.public_key_file
  docker_image       = var.docker_image
}

module "vpc_2" {
  source             = "./modules/vpc"
  aws_region         = var.aws_region
  vpc_cidr_block     = var.vpc_cidr_block_2
  subnet_cidr_block  = var.subnet_cidr_block_2
  availability_zone  = var.availability_zone_2
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  public_key_file    = var.public_key_file
  docker_image       = var.docker_image
}