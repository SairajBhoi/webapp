resource "aws_route_table" "route-table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }
  tags = {
    Name = var.Name

  }
}

output "route-table_id" {
  value = aws_route_table.route-table.id
}
