module "subnet_public" {
  source            = "./module/subnet"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "${var.aws_region}a"
  cidr_block        = var.cidr_block_public
  Name = "public-subnet"
}

module "routetable_public" {
   source     = "./module/routetable"
   vpc_id     = module.vpc.vpc_id  
   gateway_id = module.igw.igw_id
   Name       = "routetable_public"
}

module "nat-gateway" {
  source        = "./module/nat-gateway"
  allocation_id = module.elastic_ip.eip_id
  subnet_id     = module.subnet_public.subnet_id
}

module "route_table_association_public" {
  source         = "./module/route-table-association"
  subnet_id      = module.subnet_public.subnet_id
  route_table_id = module.routetable_public.route-table_id
}