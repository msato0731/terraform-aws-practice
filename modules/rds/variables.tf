variable "subnet_group_name" {
  description = "db subnet name"
  default = ""
}

variable "private_subnets" {
  description = "A list of private subnet"
  default     = []
}


variable "pg_name" {
  description = "db parameter group name"
  default = ""
}

variable "pg_family" {
  description = "db parameter family"
  default = ""
}

variable "pg_description" {
  description = "db parameter description"
  default = ""
}

variable "time_zone" {
  description = "time zone value"
  default = ""
}

variable "instance_name" {
  description = "db instance name"
  default = ""
}

variable "storage" {
  description = "db allocated storage"
  default = 1
}

variable "engine" {
  description = "db engine"
  default     = {}
}

variable "instance_class" {
  description = "db instance class"
  default = ""
}

variable "storage_type" {
  description = "db storage type"
  default = ""
}

variable "user" {
  description = "db user"
  default = {}
}

variable "publicly_accessible" {
  description = "publicly accessible"
  default = ""
}

variable "backup_retention_period" {
  description = "backup retention period"
  default = 1
}

variable "db_sg_id" {
  description = "db instance security group id"
  type        = "list"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}