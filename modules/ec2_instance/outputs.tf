output "instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = aws_instance.ec2_instance[*].id
}

output "public_ips" {
  description = "The public IPs of the EC2 instances"
  value       = aws_instance.ec2_instance[*].public_ip
}
