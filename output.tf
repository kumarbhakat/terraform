output "Region" {
  value = "${var.aws_region}"
}
output "AMI" {
  value = "${var.ami}"
}
output "INSTANCE_TYPE" {
  value = "${var.instance_type}"
}
output "SUBNETID" {
  value = "${var.subnetid}"
}
output "IAM_PROFILE" {
  value = "${var.iaminstanceprofile}"
}
output "AZ" {
  value = "${var.availabilityzone}"
}
output "SG1" {
  value = "${var.aws_security_group1}"
}
output "SG2" {
  value = "${var.aws_security_group2}"
}
output "SG3" {
  value = "${var.aws_security_group3}"
}
output "KEYPAIR" {
  value = "${var.key_pair_name}"
}
output "TAG:NAME" {
  value = "${var.name}"
}
output "TAG:Project" {
  value = "${var.projectname}"
}
output "TAG:Environment" {
  value = "${var.env}"
}
output "TAG:Cost_Group" {
  value = "${var.costgroup}"
}
output "TAG:Profile" {
  value = "${var.aws_profile}"
}
output "TAG:SSM" {
  value = "${var.ssm}"
}
output "TAG:server" {
  value = "${var.server}"
}
output "TAG:terraform" {
  value = "${var.today}"
}
output "INSTANCEID" {
  value = "${aws_instance.WORDPRESS.*.id}"
}
output "EIP" {
  value = ["${aws_eip.EIP.*.public_ip}"]
}