provider "aws" {
  region     = "ap-south-1"
}


module "vpc" {
  source     = "./module/vpc"
  cidr_block = var.cidr_block
}


module "igw" {
  source = "./module/igw"
  vpc_id = module.vpc.vpc_id
}



module "subnet_public" {
  source            = "./module/subnet"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "${var.aws_region}a"
  cidr_block        = var.cidr_block_public
  Name = "public-subnet"
}

module "routetable_public" {
   source = "./module/routetable"
   vpc_id = module.vpc.vpc_id  
   gateway_id = module.igw.igw_id
   Name = "routetable_public"
}

module "nat-gateway" {
  source = "./module/nat-gateway"
  allocation_id = module.elastic_ip.eip_id
  subnet_id     = module.subnet_public.subnet_id
}

module "route_table_association_public" {
  source = "./module/route-table-association"
  subnet_id      = module.subnet_public.subnet_id
  route_table_id = module.routetable_public.route-table_id
}

module "elastic_ip" {
  source = "./module/elastic-ip"
}

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
  source = "./module/route-table-association"
  subnet_id      = module.subnet_private_a.subnet_id
  route_table_id = module.routetable_private_a.route-table_id
}



module "security_group" {
  source      = "./module/security-group"
  vpc_id      = module.vpc.vpc_id
}

module "ec2" {
  source                 = "./module/ec2"
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = module.subnet_public.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = module.security_group.sg_id
}

module "network_interface" {
 source                 = "./module/network_interface" 
 subnet_id       = module.subnet_public.subnet_id
 security_groups = [module.security_group.sg_id]
}

module "rdsdb"{
    source = "./module/aws_db_subnet_group"
    private_id_a = module.subnet_private_a.subnet_id
    private_id_b = module.subnet_private.subnet_id
    
}



module "rds" {
    source = "./module/security-group/rds-sg"
  
  vpc_id      = module.vpc.vpc_id
  security_groups = [module.security_group.sg_id]

}

module "mysql-db" {
  source = "./module/rds-db"
  identifier        = "mysql-db"
  engine            = var.engine 
  engine_version    = var.engine_version
  instance_class    = var.instance_class 
  username          = var.username  
  password          = var.password 
  vpc_security_group_ids = [module.rds.sg_id]
  db_subnet_group_name = module.rdsdb.rdsdb-name
  allocated_storage = var.allocated_storage
   
}

module "ecr" {
  source = "./module/ecr"

  ecr_repo_name = var.ecr_repo_name
}