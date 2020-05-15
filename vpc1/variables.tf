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
