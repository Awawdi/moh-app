#!/bin/bash



yum update -y
yum install -y docker

usermod -aG docker ec2-user

systemctl start docker
systemctl enable docker


docker run -d -p 80:5000 ${DOCKER_IMAGE}
