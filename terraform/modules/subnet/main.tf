resource "aws_subnet" "primary" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_primary
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "secondary" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_secondary
  availability_zone = "${var.region}c"
}
