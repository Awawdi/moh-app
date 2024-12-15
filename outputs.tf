output "vpc1_id" {
  description = "The ID of VPC 1"
  value       = module.vpc1.vpc_id
}

output "vpc1_subnet_id" {
  description = "The ID of the Subnet in VPC 1"
  value       = module.vpc1.subnet_id
}

output "vpc2_id" {
  description = "The ID of VPC 2"
  value       = var.create_vpc2 ? module.vpc2[0].vpc_id : null
}

output "vpc2_subnet_id" {
  description = "The ID of the Subnet in VPC 2"
  value       = var.create_vpc2 ? module.vpc2[0].subnet_id : null
}

output "blue_instance_public_ips" {
  description = "Public IPs of the blue instances"
  value       = flatten([for instance in module.blue_instance : instance.public_ips])
}

output "green_instance_public_ips" {
  description = "Public IPs of the green instances"
  value       = flatten([for instance in module.green_instance : instance.public_ips])
}

