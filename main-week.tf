provider "aws" {
  region     = "ap-south-1"
}


module "vpc" {
  source     = "./module/vpc"
  cidr_block = var.cidr_block
}


module "igw" {
  source = "./module/igw"
  vpc_id = module.vpc.vpc_id
}


module "elastic_ip" {
  source = "./module/elastic-ip"
}











