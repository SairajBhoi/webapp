resource "aws_db_subnet_group" "rdsdb" {
  name       = "rdsdb-subnet-group"
  subnet_ids = [var.private_id,var.public_id]

  tags = {
    Name = "rdsdb-subnet-group"
  }
}

output "rdsdb-name" {
  value =  aws_db_subnet_group.rdsdb.name
}