resource "aws_db_instance" "mysql-db" {
  identifier        = var.identifier  
  engine            = var.engine 
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  username          = aws_secretsmanager_secret_version.rds_rds_secret.secret_string["username"]
  password          = aws_secretsmanager_secret_version.rds_rds_secret.secret_string["password"] 
  # username          = var.username  
  # password          = var.password 
  skip_final_snapshot = true
  allocated_storage = var.allocated_storage
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "mysql-db-rds"
  }
}

data "aws_secretsmanager_secret_version" "rds_secret"{
  secret_id = "mysql-db-secret"
}
