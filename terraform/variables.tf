variable "region" {
  type    = string
  default = "us-west-2"
}

variable "ami" {
  type        = string
  description = "AMI for ec2 instance"
  default     = "ami-08e2d37b6a0129927"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "s3_acl" {
  type    = string
  default = "private"
}

variable "env" {
  type    = string
  default = "dev"
}
