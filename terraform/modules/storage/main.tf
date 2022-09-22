resource "aws_db_subnet_group" "example_rds_subnet_grp" {
  name       = "example_rds_subnet_grp_${var.environment}"
  subnet_ids = var.private_subnet

  tags = merge(var.default_tags, {
    Name = "example_rds_subnet_grp_${var.environment}"
  })
}

resource "aws_security_group" "example_rds_sg" {
  name   = "example_rds_sg"
  vpc_id = var.vpc_id

  tags = merge(var.default_tags, {
    Name = "example_rds_sg_${var.environment}"
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
  })
}

resource "aws_db_instance" "example_db" {
  name                      = "example_db_${var.environment}"
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
  })
}

resource "aws_ssm_parameter" "example_ssm_db_host" {
  name        = "/example-${var.environment}/DB_HOST"
  description = "example Database"
  type        = "String"
  value       = aws_db_instance.example_db.endpoint

  tags = merge(var.default_tags, {})
}

resource "aws_ssm_parameter" "example_ssm_db_password" {
  name        = "/example-${var.environment}/DB_PASSWORD"
  description = "example Database Password"
  type        = "String"
  value       = aws_db_instance.example_db.password

  tags = merge(var.default_tags, {})
}

resource "aws_ssm_parameter" "example_ssm_db_user" {
  name        = "/example-${var.environment}/DB_USER"
  description = "example Database Username"
  type        = "String"
  value       = aws_db_instance.example_db.username

  tags = merge(var.default_tags, {})
}
resource "aws_ssm_parameter" "example_ssm_db_name" {
  name        = "/example-${var.environment}/DB_NAME"
  description = "example Database Name"
  type        = "String"
  value       = aws_db_instance.example_db.name

  tags = merge(var.default_tags, {
    environment = "${var.environment}"
  })
}

resource "aws_s3_bucket" "example_storage" {
  bucket = "example-storage-${var.environment}-demo"
  tags = merge(var.default_tags, {
    name = "example_blob_storage_${var.environment}"
  })
}

resource "aws_s3_bucket" "my-new-undeployed-bucket" {
  bucket = "example-public-${var.environment}-demo"
}

resource "aws_s3_bucket_public_access_block" "example_public" {
  bucket = aws_s3_bucket.my-new-undeployed-bucket.id

  ignore_public_acls = var.public_var_test
  block_public_acls   = var.public_var_test
  block_public_policy = var.public_var_test
}

resource "aws_s3_bucket_public_access_block" "example_private" {
  bucket = aws_s3_bucket.example_storage.id

  ignore_public_acls  = true
  block_public_acls   = true
  block_public_policy = true
}
