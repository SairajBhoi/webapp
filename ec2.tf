module "ec2" {
  source                 = "./module/ec2"
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = module.subnet_public.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = module.security_group.sg_id
}

module "security_group" {
  source      = "./module/Network/security-group"
  vpc_id      = module.vpc.vpc_id
}
module "network_interface" {
 source          =  "./module/Network/network_interface" 
 subnet_id       =  module.subnet_public.subnet_id
 security_groups = [module.security_group.sg_id]
}
