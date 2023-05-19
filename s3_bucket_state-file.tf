terraform {
    backend "s3" {
        bucket = "state-file-bucket-tf"
        key    = "terraform.tfstate"
        region =  "ap-south-1"
    }        

}   