data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "drift_instance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2_instance_type
  vpc_security_group_ids      = [aws_security_group.terraform-aws-sg.id]
  associate_public_ip_address = true
  key_name                    = var.ec2_key_name
  root_block_device {
    volume_size = "100"
  }
  tags = {
    Name       = "ubuntu drift"
    Managed_by = "terraform"
    yor_trace  = "1acc34a9-7ea3-4559-aa6e-a2a6374612f6"
  }
}