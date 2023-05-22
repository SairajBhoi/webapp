cidr_block           = "192.168.0.0/16"
cidr_block_public    = "192.168.1.0/24"
cidr_block_private   = "192.168.2.0/24"
cidr_block_private_a = "192.168.3.0/24"

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

ecr_repo_name     = "web-app-repository-week-assignment-class-c"