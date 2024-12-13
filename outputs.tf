output "east_vpc_id" {
  value = module.east_vpc.vpc_id
}

output "west_vpc_id" {
  value = module.west_vpc.vpc_id
}

output "east_instance_public_ip" {
  description = "The public IP address of the instance in east_vpc"
  value       = module.east_vpc.instance_public_ip
}

output "west_instance_public_ip" {
  description = "The public IP address of the instance in west_vpc"
  value       = module.west_vpc.instance_public_ip
}
