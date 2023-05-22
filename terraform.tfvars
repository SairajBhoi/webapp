cidr_block           = "172.16.0.0/16"
cidr_block_public    = "172.16.1.0/24"
cidr_block_private   = "172.16.2.0/24"
cidr_block_private_a = "172.16.3.0/24"

aws_region          = "ap-south-1"
ami                 = "ami-02eb7a4783e7e9317"
instance_type       = "t2.micro"
key_name            = "test"

#db variable defination
identifier        = "mysql-db"
engine            = "mysql"
engine_version    = "5.7"
instance_class    = "db.t2.micro"
allocated_storage = 10

ecr_repo_name     = "web-app-repository-week-assignment"