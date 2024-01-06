
module "vpc1" {
  source         = "./vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = var.vpc_name
}


module "subnet1" {
  source = "./subnet"

  vpc_id            = module.vpc1.vpc_id
  cidr_block        = var.subnet_cidr_block
  subnet_name       = var.subnet_name
  availability_zone = var.availability_zone
}

module "subnet2" {
  source = "./subnet"

  vpc_id            = module.vpc1.vpc_id
  cidr_block        = var.subnet2_cidr_block
  subnet_name       = var.subnet2_name
  availability_zone = var.availability_zone
}

module "network1" {
  source = "./network"

  vpc_id                 = module.vpc1.vpc_id
  subnet_cidr            = module.subnet1.subnet_cidr
  default_route_table_id = module.vpc1.vpc_default_route_table_id
  private_subnet_id      = module.subnet2.subnet_id

}
