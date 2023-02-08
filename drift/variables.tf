variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}
variable "ec2_key_name" {
  type    = string
  default = "jmKeyPair"
}