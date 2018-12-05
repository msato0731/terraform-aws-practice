resource "aws_security_group" "alb_sg" {
  vpc_id = "${var.vpc_id}"
  name = "${lookup(var.security_group_name, "alb")}"
  description = "${lookup(var.security_group_name, "alb")}"
  
  tags {
    Name = "${lookup(var.security_group_name, "alb")}"
  }
}

resource "aws_security_group" "web_sg" {
  vpc_id = "${var.vpc_id}"
  name = "${lookup(var.security_group_name, "web")}"
  description = "${lookup(var.security_group_name, "web")}"
  
  tags {
    Name = "${lookup(var.security_group_name, "web")}"
  }
}

resource "aws_security_group" "db_sg" {
  vpc_id = "${var.vpc_id}"
  name = "${lookup(var.security_group_name, "db")}"
  description = "${lookup(var.security_group_name, "db")}"
  
  tags {
    Name = "${lookup(var.security_group_name, "db")}"
  }
}

