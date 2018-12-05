resource "aws_security_group_rule" "db_mysql" {
   security_group_id = "${aws_security_group.db_sg.id}"
   type = "ingress"
   from_port = 3306
   to_port = 3306
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "db_outboud_allow" {
   security_group_id = "${aws_security_group.db_sg.id}"
   type = "egress"
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
}