provider "aws" {
  version = "~> 1.60"
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

resource "aws_instance" "WORDPRESS" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnetid}"
  iam_instance_profile = "${var.iaminstanceprofile}"
  availability_zone = "${var.availabilityzone}"
  security_groups = ["${var.aws_security_group1}"]
  security_groups = ["${var.aws_security_group2}"]
  security_groups = ["${var.aws_security_group3}"]
  associate_public_ip_address = "true"
  key_name = "${var.key_pair_name}"
  count = "${var.count}"
  root_block_device {
      volume_type = "gp2"
      volume_size = "${var.volume_size}"
      delete_on_termination = true
    }

  tags {
    Name = "${var.name}"
    Project = "${var.projectname}"
    Environment = "${var.env}"
    Cost_Group = "${var.costgroup}"
    Profile = "${var.aws_profile}"
    SSM = "${var.ssm}"
    Server = "${var.server}"
    Terraform = "${var.today}"
  }
}

##---------ASSIGN EIP-------------##
resource "aws_eip" "EIP" {
  count = "${var.count}"
  instance = "${element(aws_instance.WORDPRESS.*.id, count.index)}"
  vpc = true
}