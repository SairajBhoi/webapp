
resource "aws_security_group" "security-group" {
  name_prefix = "security-group"
  vpc_id = var.vpc_id


  ingress {
    from_port = local.ssh
    to_port = local.ssh
    protocol = local.Protocol
    cidr_blocks = [local.cidr_blocks]
  }

  ingress {
    from_port = local.http
    to_port = local.http
    protocol = local.Protocol
    cidr_blocks = [local.cidr_blocks]
  }
ingress {
    from_port = local.https
    to_port = local.https
    protocol = local.Protocol
    cidr_blocks  = [local.cidr_blocks]
  }

ingress {
    from_port = local.php-admin
    to_port = local.php-admin
    protocol = local.Protocol
    cidr_blocks  = [local.cidr_blocks]
  }
ingress {
    from_port = local.jenkins
    to_port = local.jenkins
    protocol = local.Protocol
    cidr_blocks  = [local.cidr_blocks]
  }
egress {
    from_port = local.all
    to_port = local.all
    protocol = local.out_protocol
    cidr_blocks = [local.cidr_blocks]
  }

  tags = {
    Name = "security-group"
  }
}

output "sg_id" {
  value = aws_security_group.security-group.id
}


locals {
  ssh = 22
  http = 80
  https = 443
  php-admin= 8085
  jenkins = 8080
  all = 0
  out_protocol= "-1"
  Protocol = "tcp"
  cidr_blocks = "0.0.0.0/0"
}
