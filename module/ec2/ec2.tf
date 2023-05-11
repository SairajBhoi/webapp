resource "aws_instance" "remote" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [var.vpc_security_group_ids]
  
   tags = {
    Name = "ec2-instance-node"
    }
    user_data= <<-EOF
               #!/bin/bash
               sudo apt-get update -y
               sudo apt-get install -y docker.io
               systemctl start docker
               systemctl enable docker
               docker run --name phpadmin-container -e PMA_ARBITRARY=1 -p 8085:80  phpmyadmin/phpmyadmin
               EOF
}