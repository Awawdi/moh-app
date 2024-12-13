output "vpc_1_id" {
  description = "The ID of the first VPC"
  value       = module.vpc_1.vpc_id
}

output "vpc_2_id" {
  description = "The ID of the second VPC"
  value       = module.vpc_2.vpc_id
}

output "vpc_1_instance_public_ip" {
  description = "The public IP address of the instance in the first VPC"
  value       = module.vpc_1.instance_public_ip
}

output "vpc_2_instance_public_ip" {
  description = "The public IP address of the instance in the second VPC"
  value       = module.vpc_2.instance_public_ip
}