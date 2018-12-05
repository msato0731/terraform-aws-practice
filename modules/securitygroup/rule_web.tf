 resource "aws_security_group_rule" "web_ssh" {
     security_group_id = "${aws_security_group.web_sg.id}"
     type = "ingress"
     from_port = 22
     to_port = 22
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
 }
 
resource "aws_security_group_rule" "web_http" {
   security_group_id = "${aws_security_group.web_sg.id}"
   type = "ingress"
   from_port = 80
   to_port = 80
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "web_outboud_allow" {
   security_group_id = "${aws_security_group.web_sg.id}"
   type = "egress"
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
}