module "subnet_private_a" {
  source            = "./module/subnet"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "${var.aws_region}a"
  cidr_block        = var.cidr_block_private_a
  Name = "private-subnet-a"
}

module "routetable_private_a" {
  source = "./module/routetable"
  vpc_id = module.vpc.vpc_id  
  gateway_id = module.nat-gateway.nat-gw_id
  Name = "routetable_private"
}

module "route_table_association_private_a" {
  source         = "./module/route-table-association"
  subnet_id      = module.subnet_private_a.subnet_id
  route_table_id = module.routetable_private_a.route-table_id
}
