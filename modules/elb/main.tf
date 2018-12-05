resource "aws_alb" "alb" {
  name = "${var.name}"
  security_groups = ["${var.alb_sg_id}"]
  subnets = ["${var.public_subnets}"]
  internal = "${var.internal}"
  tags = "${merge(var.tags, map("Name", "alb"))}"
}

resource "aws_lb_target_group" "tg-http" {
  name = "${var.tg_name}"
  port = "${var.tg_port}"
  protocol = "${var.tg_protocol}"
  vpc_id = "${var.vpc_id}"
}

resource "aws_lb_listener" "listener-http" {
  load_balancer_arn = "${aws_alb.alb.arn}"
  port = "${var.listener_port}"
  protocol = "${var.listener_protocol}"

  default_action {
    type = "${var.default_action_type}"
    target_group_arn = "${aws_lb_target_group.tg-http.arn}"
  }
}

resource "aws_lb_target_group_attachment" "tg-http-attach" {
  count = "2"
  target_group_arn = "${aws_lb_target_group.tg-http.arn}"
  target_id        = "${var.instance_id[count.index]}"
  port             = 80
}