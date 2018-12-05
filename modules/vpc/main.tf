resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_host_names}"
  enable_dns_support   = "${var.dns_support}"

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

resource "aws_subnet" "public" {
  count = "${length(var.public_subnets)}"

  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.public_subnets[count.index]}"
  availability_zone = "${element(var.azs, count.index)}"

  tags = "${merge(var.tags, map("Name", format("%s-subnet-public-%s", var.name, element(var.azs, count.index))))}"
}
resource "aws_subnet" "private" {
  count = "${length(var.private_subnets)}"

  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.private_subnets[count.index]}"
  availability_zone = "${element(var.azs, count.index)}"

  tags = "${merge(var.tags, map("Name", format("%s-subnet-private-%s", var.name, element(var.azs, count.index))))}"
}

resource "aws_internet_gateway" "igw" {
  vpc_id            = "${aws_vpc.vpc.id}"
  tags = "${merge(var.tags, map("Name", format("%s-igw", var.name)))}"
}

resource "aws_route_table" "public" {
  count = "${length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id           = "${aws_vpc.vpc.id}"

  tags = "${merge(var.tags, map("Name", format("%s-rt-public", var.name)))}"
}

resource "aws_route" "public_internet_gateway" {
  count = "${length(var.public_subnets) > 0 ? 1 : 0}"

  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}

resource "aws_route_table" "private" {
  count = "${length(var.private_subnets) > 0 ? 1 : 0}"
  vpc_id           = "${aws_vpc.vpc.id}"

  tags = "${merge(var.tags, map("Name", format("%s-rt-private", var.name, )))}"
}

resource "aws_route_table_association" "public" {
  count = "${length(var.public_subnets)}"

  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
}

resource "aws_route_table_association" "private" {
  count = "${length(var.private_subnets)}"

  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}
