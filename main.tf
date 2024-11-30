terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use 5.x provider versions
    }
  }
}

provider "aws" {
  region = "us-east-1" # Replace with your preferred region
}


# Create a VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "MainVPC"
  }
}

# Create a Subnet
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a" # Replace if using another region
  tags = {
    Name = "MainSubnet"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "MainInternetGateway"
  }
}

# Create a Route Table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "MainRouteTable"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

# Create a Security Group
resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "MainSecurityGroup"
  }
}

# Create a key pair for the EC2 instance
resource "aws_key_pair" "my_key" {
  key_name   = "moh-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")  # Use the path to your public key file
}

# Launch a new EC2 instance with the created key pair
resource "aws_instance" "main" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.main.id] # Use vpc_security_group_ids instead
  key_name = aws_key_pair.my_key.key_name
  tags = {
    Name = "MOHInstance"
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = 8  # Size in GB
  }

  # Add a startup script to install Docker and run the container
  user_data = <<-EOF
            #!/bin/bash
            yum update -y
            yum install -y docker
            sudo usermod -aG docker ec2-user
            systemctl start docker
            systemctl enable docker
            docker run -d -p 80:5000 orsanaw/moh-hello-world-app
            EOF

}
