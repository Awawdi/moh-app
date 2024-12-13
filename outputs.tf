output "east_vpc_id" {
  value = module.east_vpc.vpc_id
}

output "vpc_east_2_id" {
  value = module.vpc_east_2.vpc_id
}

output "east_instance_public_ip" {
  description = "The public IP address of the instance in east_vpc"
  value       = module.east_vpc.instance_public_ip
}

output "vpc_east_2_instance_public_ip" {
  description = "The public IP address of the instance in vpc_east_2"
  value       = module.vpc_east_2.instance_public_ip
}