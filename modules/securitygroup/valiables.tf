variable "security_group_name_alb" {
  description = "The name for the security group"
  default     = ""
}

variable "security_group_name_web" {
  description = "The name for the security group"
  default     = ""
}

variable "security_group_name_db" {
  description = "The name for the security group"
  default     = ""
}

variable "vpc_id" {
  description = "The VPC this security group will go in"
}

variable "security_group_name" {
  description = "vpc name tag"
  default     = {}
}