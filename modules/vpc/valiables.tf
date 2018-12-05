variable "cidr" {
  description = "vpc cidr"
  default     = ""
}

variable "enable_dns_host_names" {
  description = "dns host enable"
  default     = ""
}

variable "dns_support" {
  description = "dns support"
  default     = ""
}

variable "name_tag" {
  description = "vpc name tag"
  default     = ""
}

variable "azs" {
  description = "A list of Availability zones"
  default     = []
}

variable "public_subnets" {
  description = "A list of public subnet inside vpc  cidr"
  default     = []
}
variable "private_subnets" {
  description = "A list of privatesubnet inside vpc  cidr"
  default     = []
}


variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}
variable "name" {
  description = "A map of tags to add to all resources"
  default     = ""
}