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

variable "subnet_id" {
  description = "The Subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "docker_image"{
  description = "Docker image to run on the EC2 instances"
  type        = string
}

variable "instance_name" {
    description = "Name of the EC2 instance"
    type        = string
}

variable "security_group_ids" {
  description = "List of Security Group IDs to associate with the EC2 instance"
  type        = list(string)
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 1
}
variable "module_count" {
  description = "Count of this module for unique instance naming"
  type        = number
  default     = 0
}