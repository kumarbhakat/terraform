#-----networking/outputs.tf----

output "public_subnets" {
  value = aws_subnet.tf_public_subnet.*.id
}

output "public_sg" {
  value = aws_security_group.tf_public_sg.id
}

output "subnet_ips" {
  value = aws_subnet.tf_public_subnet.*.cidr_block
}

[root@ip-172-31-40-50 test]# cat terraform.tfvars
region  = "us-east-1"

vpc_cidr     = "10.123.0.0/16"
public_cidrs = [
  "10.123.1.0/24",
  "10.123.2.0/24"
]
accessip    = "0.0.0.0/0"
