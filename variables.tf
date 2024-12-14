variable "aws_region" {
  description = "AWS region for all resources"
  default     = "us-east-1"
}

variable "vpc1_cidr_block" {
  description = "CIDR block for VPC 1"
  default     = "10.0.0.0/16"
}

variable "vpc2_cidr_block" {
  description = "CIDR block for VPC 2"
  default     = "10.1.0.0/16"
}

variable "vpc1_subnet_cidr_block" {
  description = "CIDR block for Subnet in VPC 1"
  default     = "10.0.1.0/24"
}

variable "vpc2_subnet_cidr_block" {
  description = "CIDR block for Subnet in VPC 2"
  default     = "10.1.1.0/24"
}

variable "vpc1_availability_zone" {
  description = "Availability Zone for Subnet in VPC 1"
  default     = "us-east-1a"
}

variable "vpc2_availability_zone" {
  description = "Availability Zone for Subnet in VPC 2"
  default     = "us-east-1b"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-0453ec754f44f9a4a"
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  default     = "t3.small"
}

variable "public_key_file" {
  description = "Path to the public SSH key file"
  default     = "~/.ssh/tf-key.pub"
}

variable "docker_image_blue" {
  description = "Docker image to run on the EC2 instances"
  type        = string
  default     = "orsanaw/moh-hello-world-app:blue"
}

variable "docker_image_green" {
  description = "Docker image to run on the EC2 instances"
  type        = string
  default     = "orsanaw/moh-hello-world-app:green"
}

variable "create_vpc2" {
  description = "Whether to create VPC 2"
  type        = bool
  default     = false
}