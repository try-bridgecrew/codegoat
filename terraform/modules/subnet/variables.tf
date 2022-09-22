variable "cidr_primary" {
  type    = string
  default = "10.0.0.0/24"
}

variable "cidr_secondary" {
  type    = string
  default = "10.0.100.0/24"
}

variable "vpc_id" {
  type    = string
}

variable "region" {
  type    = string
}
