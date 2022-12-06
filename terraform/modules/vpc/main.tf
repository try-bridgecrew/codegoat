resource "aws_vpc" "example" {
  cidr_block = var.cidr
  tags = {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/vpc/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "595c04ed-9f1f-4884-9d0c-d9e81b3d45de"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.example.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
  tags = {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/vpc/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "ea82ec59-36e8-4723-8e71-e3dcac8779c6"
  }
}

resource "aws_security_group" "allow_all_ssh" {
  name        = "allow_all_ssh"
  description = "Allow SSH inbound from anywhere"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/vpc/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "dc774db6-b43d-473c-81bc-e56179320756"
  }
}

resource "aws_security_group" "allow_ssh_from_valid_cidr" {
  name        = "allow_ssh_from_valid_cidr"
  description = "Allow SSH inbound from specific range"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = tolist([var.cidr])
  }
  tags = {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/vpc/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "fc4802fc-f95c-474e-bb7f-821f148741cb"
  }
}
