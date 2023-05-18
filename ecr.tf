module "ecr" {
  source = "./module/ecr"

  ecr_repo_name = var.ecr_repo_name
}