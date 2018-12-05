resource "aws_security_group_rule" "alb_http" {
   security_group_id = "${aws_security_group.alb_sg.id}"
   type = "ingress"
   from_port = 80
   to_port = 80
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_outboud_allow" {
   security_group_id = "${aws_security_group.alb_sg.id}"
   type = "egress"
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
}