module "igw" {
  source = "./module/igw"
  vpc_id = module.vpc.vpc_id
}

module "nat-gateway" {
  source = "./module/nat-gateway"
  allocation_id = module.elastic_ip.eip_id
  subnet_id     = module.subnet_public.subnet_id
}

module "elastic_ip" {
  source = "./module/elastic-ip"
}