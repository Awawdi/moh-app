variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr_block_1" {
  default = "10.0.0.0/16"
}

variable "vpc_cidr_block_2" {
  default = "10.0.1.0/16"
}

variable "subnet_cidr_block_1" {
  default = "10.0.0.0/24"
}

variable "subnet_cidr_block_2" {
  default = "10.0.1.0/24"
}

variable "availability_zone_1" {
  default = "us-east-1a"
}

variable "availability_zone_2" {
  default = "us-east-1b"
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "public_key_file" {
  default = "/home/orsan/.aws/new-key-pair.pub"
}

variable "docker_image" {
  default = "orsanaw/moh-hello-world-app"
}