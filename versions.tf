terraform {
  required_version = ">= 0.12"
}
[root@ip-172-31-40-50 test]# cat variables.tf 
#----networking/variables.tf----
variable "region" {
}

variable "vpc_cidr" {
}

variable "public_cidrs" {
  type = list(string)
}

variable "accessip" {
}
