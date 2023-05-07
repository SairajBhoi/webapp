resource "aws_eip" "eip" {
  vpc = true
  tags = {
    Name = "elastic_ip"
  }
}
output "eip_id" {
  value =   aws_eip.eip.id
}