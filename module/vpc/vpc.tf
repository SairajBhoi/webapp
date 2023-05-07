resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}