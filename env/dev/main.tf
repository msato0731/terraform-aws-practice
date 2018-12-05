variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable "environment" {}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "vpc" {
  name   = "my-vpc"
  source = "../../modules/vpc"

  cidr                  = "10.0.0.0/16"
  enable_dns_host_names = "true"
  dns_support           = "true"
  name_tag              = "test"

  azs             = ["ap-northeast-1a", "ap-northeast-1c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  tags {
    "Terraform"   = "true"
    "Environment" = "${var.environment}"
  }
}

module "s3" {
  source     = "../../modules/s3"
  name       = "terraform-state-c9-sato"
  acl        = "private"
  versioning = "true"
}

module "securitygroup" {
  source                  = "../../modules/securitygroup/"
  security_group_name_alb = "alb_sg"
  security_group_name_web = "web_sg"
  security_group_name_db  = "db_sg"
  vpc_id                  = "${module.vpc.vpc_id}"

  security_group_name {
    "alb" = "alb_sg"
    "web" = "web_sg"
    "db"  = "db_sg"
  }
}

module "ec2" {
  source = "../../modules/ec2/"

  instance_count = 2

  ami                 = "ami-da9e2cbc"
  instance_type       = "t2.micro"
  key_name            = "syayou_mykey20180629"
  public_subnets      = "${module.vpc.public_subnets}"
  web_sg_id           = "${module.securitygroup.web_sg_id}"
  associate_public_ip = "true"

  tags {
    "Terraform"   = "true"
    "Environment" = "${var.environment}"
  }
}

module "elb" {
  source = "../../modules/elb/"

  name = "alb"
  alb_sg_id = "${module.securitygroup.alb_sg_id}"
  public_subnets = "${module.vpc.public_subnets}"
  internal = "false"
  tg_name = "tg-http"
  tg_port = "80"
  tg_protocol = "HTTP"
  vpc_id                  = "${module.vpc.vpc_id}"
  listener_port = "80"
  listener_protocol = "HTTP"
  default_action_type = "forward"
  instance_id = "${module.ec2.instance_id}"
  tags {
    "Terraform"   = "true"
    "Environment" = "${var.environment}"
  }
}

module "rds" {
  source = "../../modules/rds/"
  subnet_group_name = "test_subnet_group"
  private_subnets = "${module.vpc.private_subnets}"
  pg_name = "test-parameter-group"
  pg_family = "mysql5.7"
  pg_description = "Managed by Terraform"
  time_zone = "Asia/Tokyo"
  instance_name = "dbinstance"
  storage = 5
  engine {
    "name" = "mysql"
    "version" = "5.7.23"
  }
  instance_class = "db.t2.micro"
  user {
    "name" = "dbuser"
    "password" = "password"
  }
  publicly_accessible = "false"
  backup_retention_period = 1
  db_sg_id = "${module.securitygroup.db_sg_id}"
  tags {
    "Terraform"   = "true"
    "Environment" = "${var.environment}"
  }
   

}