module "subnet_private" {
  source            = "./module/subnet"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "${var.aws_region}b"
  cidr_block        = var.cidr_block_private
  Name = "private-subnet"
}

module "routetable_private" {
  source = "./module/routetable"
  vpc_id = module.vpc.vpc_id  
  gateway_id = module.nat-gateway.nat-gw_id
  Name = "routetable_private"
}

module "route_table_association_private" {
  source = "./module/route-table-association"
  subnet_id      = module.subnet_private.subnet_id
  route_table_id = module.routetable_private.route-table_id
}