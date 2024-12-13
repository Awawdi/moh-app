variable "aws_region" {
  description = "The AWS region to deploy the VPC"
  default     = "us-east-1"
}

variable "vpc_cidr_block_1" {
  description = "The CIDR block for the first VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_cidr_block_2" {
  description = "The CIDR block for the second VPC"
  default     = "10.0.1.0/16"
}

variable "subnet_cidr_block_1" {
  description = "The CIDR block for the first subnet"
  default     = "10.0.0.0/24"
}

variable "subnet_cidr_block_2" {
  description = "The CIDR block for the second subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone_1" {
  description = "The availability zone for the first subnet"
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "The availability zone for the second subnet"
  default     = "us-east-1b"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "public_key_file" {
  description = "The path to the public key file"
  default     = "/home/orsan/.aws/new-key-pair.pub"
}

variable "docker_image" {
  description = "The Docker image to run on the EC2 instance"
  default     = "orsanaw/moh-hello-world-app"
}