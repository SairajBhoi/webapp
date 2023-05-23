
provider "aws" {
  region     = "ap-south-1"
}


module "vpc" {
  source     = "./module/Network/vpc"
  cidr_block = var.cidr_block
}



module "igw" {
  source = "./module/Network/igw"
  vpc_id = module.vpc.vpc_id
}


module "elastic_ip" {
  source = "./module/Network/elastic-ip"
}

module "subnet_private_a" {
  source            = "./module/Network/subnet"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "${var.aws_region}a"
  cidr_block        = var.cidr_block_private_a
  Name = "private-subnet-a"
}

module "routetable_private_a" {
  source = "./module/Network/routetable"
  vpc_id = module.vpc.vpc_id  
  gateway_id = module.nat-gateway.nat-gw_id
  Name = "routetable_private"
}

module "route_table_association_private_a" {
  source         = "./module/Network/route-table-association"
  subnet_id      = module.subnet_private_a.subnet_id
  route_table_id = module.routetable_private_a.route-table_id
}


module "subnet_private" {
  source            = "./module/Network/subnet"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "${var.aws_region}b"
  cidr_block        = var.cidr_block_private
  Name              = "private-subnet"
}

module "routetable_private" {
  source           = "./module/Network/routetable"
  vpc_id           = module.vpc.vpc_id  
  gateway_id       = module.nat-gateway.nat-gw_id
  Name             = "routetable_private"
}

module "route_table_association_private" {
  source          = "./module/Network/route-table-association"
  subnet_id      = module.subnet_private.subnet_id
  route_table_id = module.routetable_private.route-table_id
}


module "subnet_public" {
  source            = "./module/Network/subnet"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "${var.aws_region}a"
  cidr_block        = var.cidr_block_public
  Name = "public-subnet"
}

module "routetable_public" {
   source     = "./module/Network/routetable"
   vpc_id     = module.vpc.vpc_id  
   gateway_id = module.igw.igw_id
   Name       = "routetable_public"
}

module "nat-gateway" {
  source        = "./module/Network/nat-gateway"
  allocation_id = module.elastic_ip.eip_id
  subnet_id     = module.subnet_public.subnet_id
}

module "route_table_association_public" {
  source         = "./module/Network/route-table-association"
  subnet_id      = module.subnet_public.subnet_id
  route_table_id = module.routetable_public.route-table_id
}