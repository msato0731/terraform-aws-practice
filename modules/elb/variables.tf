variable "name" {
  description = "elb name"
  default = ""
}

variable "alb_sg_id" {
  description = "elb security group id"
  type        = "list"
}

variable "public_subnets" {
  description = "A list of public subnet inside vpc  cidr"
  default     = []
}

variable "internal" {
  description = "internal or internet"
  default = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "tg_name" {
  description = "target group name"
  default = ""
}

variable "tg_port" {
  description = "target group port"
  default = ""
}

variable "tg_protocol" {
  description = "target group protocol"
  default = ""
}

variable "vpc_id" {
  description = "The VPC this security group will go in"
}

variable "listener_port" {
  description = "listener port"
  default = ""
}

variable "listener_protocol" {
  description = "listener protocol"
  default = ""
}

variable "default_action_type" {
  description = "default action type"
  default = ""
}

variable "instance_id" {
  description = "A list of public instance id"
  default     = []
}

