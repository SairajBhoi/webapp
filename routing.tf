module "routetable_public" {
   source = "./module/routetable"
   vpc_id = module.vpc.vpc_id  
   gateway_id = module.igw.igw_id
   Name = "routetable_public"
}
module "route_table_association_public" {
  source = "./module/route-table-association"
  subnet_id      = module.subnet_public.subnet_id
  route_table_id = module.routetable_public.route-table_id
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

module "routetable_private_a" {
  source = "./module/routetable"
  vpc_id = module.vpc.vpc_id  
  gateway_id = module.nat-gateway.nat-gw_id
  Name = "routetable_private"
}

module "route_table_association_private_a" {
  source = "./module/route-table-association"
  subnet_id      = module.subnet_private_a.subnet_id
  route_table_id = module.routetable_private_a.route-table_id
}