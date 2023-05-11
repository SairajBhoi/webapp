variable "cidr_block" {
    default =  "10.0.0.0/16"
}

variable "aws_region" {
}

variable "ami" {
}

variable "instance_type"  {
}

variable "key_name" {
}

variable "cidr_block_public"{
}

variable "cidr_block_private"{   
}

variable "cidr_block_private_a"{
}

#mysql variables
variable "identifier" {
}

variable "engine" {
}

variable "engine_version"{
}

variable "instance_class"{
}

variable "username"{
}  

variable "password" {
}

variable "allocated_storage" {
}

variable "ecr_repo_name" {
}