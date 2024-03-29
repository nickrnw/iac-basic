resource "aws_subnet" "subnet-uno" {
  cidr_block = "${cidrsubnet(aws_vpc.terraform-test-env.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.terraform-test-env.id}"
  availability_zone = "${var.region}"
}
resource "aws_route_table" "route-table-terraform-test-env" {
  vpc_id = "${aws_vpc.terraform-test-env.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform-test-env-gw.id}"
  }
  tags = {
    Name = "terraform-test-env-route-table"
  }
}
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.subnet-uno.id}"
  route_table_id = "${aws_route_table.route-table-terraform-test-env.id}"
}