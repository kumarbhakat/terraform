terraform {
  backend "s3" {
    bucket  = "terraform-backupfile"
    key     = "terraform-backupfile/terraform.tfstate"
    region  = "us-east-1"
  }
}