variable "aws_region_east" {
  default = "us-east-1"
}

variable "aws_region_west" {
  default = "us-west-1"
}

variable "vpc_cidr_block_east" {
  default = "10.0.0.0/16"
}

variable "vpc_cidr_block_west" {
  default = "10.1.0.0/16"
}

variable "subnet_cidr_block_east" {
  default = "10.0.1.0/24"
}

variable "subnet_cidr_block_west" {
  default = "10.1.1.0/24"
}

variable "availability_zone_east" {
  default = "us-east-1a"
}

variable "availability_zone_west" {
  default = "us-west-1b"
}

variable "ami_id_east" {
  default = "ami-0c02fb55956c7d316"
}

variable "ami_id_west" {
  default = "ami-0453ec754f44f9a4a"
}

variable "instance_type_east" {
  default = "t2.micro"
}

variable "instance_type_west" {
  default = "t2.micro"
}

variable "public_key_file" {
  default = "/home/orsan/.aws/new-key-pair.pub"
}

variable "docker_image" {
  default = "orsanaw/moh-hello-world-app"
}
