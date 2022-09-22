variable "environment" {
  description = "environment deploying to"
}

variable "default_tags" {
  default     = {}
  description = "default tags"
}

variable "public_var" {
  default     = false
  description = "value for publicly accessible s3"
}

variable "acl" {}

variable "private_subnet" {}

variable "vpc_id" {}

variable "db_username" {}

variable "db_password" {}
