resource "aws_internet_gateway" "terraform-test-env-gw" {
  vpc_id = "${aws_vpc.terraform-test-env.id}"
  tags = {
    Name = "terraform-test-env-gw"
  }
}