resource "aws_db_subnet_group" "example_rds_subnet_grp" {
  name       = "example_rds_subnet_grp_${var.environment}"
  subnet_ids = var.private_subnet

  tags = merge(var.default_tags, {
    Name = "example_rds_subnet_grp_${var.environment}"
    }, {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/storage/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "f2a1cfe5-e3d1-4f3e-8934-4d6114ead100"
  })
}

resource "aws_security_group" "example_rds_sg" {
  name   = "example_rds_sg"
  vpc_id = var.vpc_id

  tags = merge(var.default_tags, {
    Name = "example_rds_sg_${var.environment}"
    }, {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/storage/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "a135de5a-372b-4b70-98ad-3775ef91c7fb"
  })

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_kms_key" "example_db_kms_key" {
  description             = "KMS Key for DB instance ${var.environment}"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  tags = merge(var.default_tags, {
    Name = "example_db_kms_key_${var.environment}"
    }, {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/storage/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "988b0096-39e5-4077-99dd-120eb990cd1d"
  })
}

resource "aws_db_instance" "example_db" {
  db_name                   = "example_db_${var.environment}"
  allocated_storage         = 20
  engine                    = "postgres"
  engine_version            = "10.20"
  instance_class            = "db.t3.micro"
  storage_type              = "gp2"
  password                  = var.db_password
  username                  = var.db_username
  vpc_security_group_ids    = [aws_security_group.example_rds_sg.id]
  db_subnet_group_name      = aws_db_subnet_group.example_rds_subnet_grp.id
  identifier                = "example-db-${var.environment}"
  storage_encrypted         = true
  skip_final_snapshot       = true
  final_snapshot_identifier = "example-db-${var.environment}-db-destroy-snapshot"
  kms_key_id                = aws_kms_key.example_db_kms_key.arn
  tags = merge(var.default_tags, {
    Name = "example_db_${var.environment}"
    }, {
    git_commit           = "c5ab3fd5b4eef4d47c12b1fb7ef14cdd9feaca15"
    git_file             = "terraform/modules/storage/main.tf"
    git_last_modified_at = "2022-09-26 18:17:07"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "402cb8e8-703c-4778-af81-f322be4fc5d9"
  })
}

resource "aws_ssm_parameter" "example_ssm_db_host" {
  name        = "/example-${var.environment}/DB_HOST"
  description = "example Database"
  type        = "String"
  value       = aws_db_instance.example_db.endpoint

  tags = merge(var.default_tags, {}, {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/storage/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "4fbfdb10-f5bf-424b-af46-ab69cbb0df3c"
  })
}

resource "aws_ssm_parameter" "example_ssm_db_password" {
  name        = "/example-${var.environment}/DB_PASSWORD"
  description = "example Database Password"
  type        = "String"
  value       = aws_db_instance.example_db.password

  tags = merge(var.default_tags, {}, {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/storage/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "d066cbee-4067-495c-8377-3294ec8f5509"
  })
}

resource "aws_ssm_parameter" "example_ssm_db_user" {
  name        = "/example-${var.environment}/DB_USER"
  description = "example Database Username"
  type        = "String"
  value       = aws_db_instance.example_db.username

  tags = merge(var.default_tags, {}, {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/storage/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "218214f1-78c9-49f0-bef6-b65b3da80461"
  })
}
resource "aws_ssm_parameter" "example_ssm_db_name" {
  name        = "/example-${var.environment}/DB_NAME"
  description = "example Database Name"
  type        = "String"
  value       = aws_db_instance.example_db.name

  tags = merge(var.default_tags, {
    environment = "${var.environment}"
    }, {
    git_commit           = "f5abc4fc41b394b145ee8a23429986184e150ef1"
    git_file             = "terraform/modules/storage/main.tf"
    git_last_modified_at = "2022-09-22 19:07:11"
    git_last_modified_by = "mroberts@m-c02ff1nqml85.paloaltonetworks.local"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "f6cfbef0-a5d1-4630-a933-52adf04af603"
  })
}

resource "aws_s3_bucket" "my-private-bucket" {
  bucket = "my-private-bucket-demo"

  tags = merge(var.default_tags, {
    name = "example_private_${var.environment}"
    }, {
    git_commit           = "5e4524cf776f0c30044fcb6c8c82ee9c379f7cd1"
    git_file             = "terraform/modules/storage/main.tf"
    git_last_modified_at = "2022-09-26 20:54:59"
    git_last_modified_by = "mroberts@paloaltonetworks.com"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "26ecaeea-c233-4e1f-a4ae-a8bcb8854244"
  })
}

resource "aws_s3_bucket" "public-bucket-oops" {
  bucket = "my-public-bucket-oops-demo"

  tags = merge(var.default_tags, {
    name = "example_public_${var.environment}"
    }, {
    git_commit           = "5e4524cf776f0c30044fcb6c8c82ee9c379f7cd1"
    git_file             = "terraform/modules/storage/main.tf"
    git_last_modified_at = "2022-09-26 20:54:59"
    git_last_modified_by = "mroberts@paloaltonetworks.com"
    git_modifiers        = "mroberts"
    git_org              = "try-bridgecrew"
    git_repo             = "codegoat"
    yor_trace            = "7ecefeab-6519-4a8e-a3f6-8c849f9eff19"
  })
}

resource "aws_s3_bucket_public_access_block" "private_access" {
  bucket = aws_s3_bucket.my-private-bucket.id

  ignore_public_acls      = true
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.public-bucket-oops.id

  ignore_public_acls      = var.public_var
  block_public_acls       = var.public_var
  block_public_policy     = var.public_var
  restrict_public_buckets = var.public_var
}

resource "aws_s3_bucket_acl" "private_access_acl" {
  bucket = aws_s3_bucket.my-private-bucket.id

  acl = var.acl
}

resource "aws_s3_bucket_acl" "public_access_acl" {
  bucket = aws_s3_bucket.public-bucket-oops.id

  acl = var.acl
}
