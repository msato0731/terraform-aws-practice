resource "aws_instance" "web-server" {
  count = "${var.instance_count}"
  
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.public_subnets[count.index%2]}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${var.web_sg_id}"]
  associate_public_ip_address = "${var.associate_public_ip}"

  tags = "${merge(var.tags, map("Name", format("web%02d", count.index + 1 )))}"

}