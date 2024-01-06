output "vpc_id" {
  value = module.vpc1.vpc_id
}

output "vpc_default_route_table" {
  value = module.vpc1.vpc_default_route_table_id
}

output "vpc_default_network_acl_id" {
  value = module.vpc1.vpc_default_network_acl_id
}

output "public_subnet_id" {
  value = module.subnet1.subnet_id
}

output "private_subnet_id" {
  value = module.subnet2.subnet_id
}

output "aws_internet_gateway_id" {
  value = module.network1.aws_internet_gateway_id
}
