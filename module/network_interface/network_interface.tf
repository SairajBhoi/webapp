resource "aws_network_interface" "example_nic" {
 subnet_id       = var.subnet_id
 private_ips     = local.private_ip
 security_groups = var.security_groups
}

locals{
private_ip=["10.0.1.10"]
}
