module "vpc" {
  source     = "./module/vpc"
  cidr_block = var.cidr_block
}

module "subnet_public" {
  source            = "./module/subnet"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "${var.aws_region}a"
  cidr_block        = var.cidr_block_public
  Name = "public-subnet"
}


module "subnet_private" {
  source            = "./module/subnet"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "${var.aws_region}b"
  cidr_block        = var.cidr_block_private
  Name = "private-subnet"
}

module "subnet_private_a" {
  source            = "./module/subnet"
  vpc_id            = module.vpc.vpc_id
  availability_zone = "${var.aws_region}a"
  cidr_block        = var.cidr_block_private_a
  Name = "private-subnet-a"
}