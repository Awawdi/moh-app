terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

module "east_vpc" {
  source             = "./modules/vpc"
  aws_region         = var.aws_region_east
  vpc_cidr_block     = var.vpc_cidr_block_east
  subnet_cidr_block  = var.subnet_cidr_block_east
  availability_zone  = var.availability_zone_east
  ami_id             = var.ami_id_east
  instance_type      = var.instance_type_east
  public_key_file    = var.public_key_file
  docker_image       = var.docker_image
}

module "west_vpc" {
  source             = "./modules/vpc"
  aws_region         = var.aws_region_west
  vpc_cidr_block     = var.vpc_cidr_block_west
  subnet_cidr_block  = var.subnet_cidr_block_west
  availability_zone  = var.availability_zone_west
  ami_id             = var.ami_id_west
  instance_type      = var.instance_type_west
  public_key_file    = var.public_key_file
  docker_image       = var.docker_image
}