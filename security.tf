module "security_group" {
  source      = "./module/security-group"
  vpc_id      = module.vpc.vpc_id
}
