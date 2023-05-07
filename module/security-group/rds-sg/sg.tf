resource "aws_security_group" "rds" {
  name_prefix = "rds"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = local.mysql
    to_port     = local.mysql
    protocol    = local.Protocol
    security_groups = var.security_groups
  }

  tags = {
    Name = "rds"
  }
}

output "sg_id" {
  value = aws_security_group.rds.id
}
output "sg_name" {
  value = aws_security_group.rds.name
}

locals {
  mysql = 3306
  Protocol = "tcp"
  cidr_blocks = "0.0.0.0/0"
}
