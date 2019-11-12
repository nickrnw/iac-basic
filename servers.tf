resource "aws_instance" "test-ec2-instance" {
  ami = "${var.ami_id}"
  instance_type = "${var.instace_type}"
  key_name = "${var.ami_key_pair_name}"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
  subnet_id = "${aws_subnet.subnet-uno.id}"
}