module "rdsdb"{
    source       = "./module/aws_db_subnet_group"
    private_id_a = module.subnet_private_a.subnet_id
    private_id_b = module.subnet_private.subnet_id
    
}



module "rds" {
  source          = "./module/security-group/rds-sg"
  vpc_id          = module.vpc.vpc_id
  security_groups = [module.security_group.sg_id]

}


module "mysql-db" {
  source = "./module/rds-db"
  identifier        = "mysql-db"
  engine            = var.engine 
  engine_version    = var.engine_version
  instance_class    = var.instance_class 
  vpc_security_group_ids = [module.rds.sg_id]
  db_subnet_group_name = module.rdsdb.rdsdb-name
  allocated_storage = var.allocated_storage
   
}