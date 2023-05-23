resource "aws_nat_gateway" "nat_gtw" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id

  tags = {
    Name = "nat-gateway"
  }
}

output "nat-gw_id" {
  value =   aws_nat_gateway.nat_gtw.id
}