output "vpc1_id" {
  description = "The ID of VPC 1"
  value       = module.vpc1.vpc_id
}

output "vpc1_subnet_id" {
  description = "The ID of the Subnet in VPC 1"
  value       = module.vpc1.subnet_id
}

output "vpc1_instance_public_ip" {
  description = "The public IP of the EC2 instance in VPC 1"
  value       = module.vpc1.instance_public_ip
}

output "vpc2_id" {
  description = "The ID of VPC 2"
  value       = var.create_vpc2 ? module.vpc2[0].vpc_id : null
}

output "vpc2_subnet_id" {
  description = "The ID of the Subnet in VPC 2"
  value       = var.create_vpc2 ? module.vpc2[0].subnet_id : null
}

output "vpc2_instance_public_ip" {
  description = "The public IP of the EC2 instance in VPC 2"
  value       = var.create_vpc2 ? module.vpc2[0].instance_public_ip : null
}
