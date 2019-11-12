resource "aws_vpc" "terraform-test-env" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "terraform-test-env"
  }
}

resource "aws_eip" "ip-terraform-test-env" {
  instance = "${aws_instance.test-ec2-instance.id}"
  vpc      = true
}