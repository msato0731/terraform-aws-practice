resource "aws_db_subnet_group" "subnet_group" {
  name       = "${var.subnet_group_name}"
  subnet_ids  = ["${var.private_subnets}"]
  tags = "${merge(var.tags, map("Name", "subnet_group" ))}"

}

resource "aws_db_parameter_group" "parameter_group" {
    name = "${var.pg_name}"
    family = "${var.pg_family}"
    description = "${var.pg_description}"

    parameter {
      name = "time_zone"
      value = "${var.time_zone}"
    }
}

resource "aws_db_instance" "db-instance" {
    identifier              = "${var.instance_name}"
    allocated_storage       = "${var.storage}"
    engine                  = "${lookup(var.engine, "name")}"
    engine_version          = "${lookup(var.engine, "version")}"
    instance_class          = "${var.instance_class}"
    storage_type            = "${var.storage_type}"
    username                = "${lookup(var.user, "name")}"
    password                = "${lookup(var.user, "password")}"
    publicly_accessible     = "${var.publicly_accessible}"
    backup_retention_period = "${var.backup_retention_period}"
    vpc_security_group_ids  = ["${var.db_sg_id}"]
    db_subnet_group_name    = "${aws_db_subnet_group.subnet_group.name}"
    parameter_group_name    = "${aws_db_parameter_group.parameter_group.name}"
    tags = "${merge(var.tags, map("Name", "db_instance" ))}"
}