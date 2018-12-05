variable "instance_count" {
  description = "instance count"
  default = 1
}

variable "ami" {
  description = "ami id"
  default = ""
}

variable "instance_type" {
  description = "instance type"
  default = ""
}

variable "key_name" {
  description = "The key name to use for the instance"
  default     = ""
}

variable "public_subnets" {
  description = "A list of public subnet"
  default     = []
}

variable "web_sg_id" {
  description = "web server security group id"
  type        = "list"
}

variable "associate_public_ip" {
  description = "associate public ip address"
  default = ""
}

variable "name_tag" {
  description = "vpc name tag"
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}


