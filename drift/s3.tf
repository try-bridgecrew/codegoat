resource "aws_s3_bucket" "b" {
  bucket = "prisma-cloud-code-security-drift-bucket-jm"

  tags = {
    Name        = "My drift test bucket"
    Environment = "Prod"
    yor_trace   = "1aa09c71-8ec4-4b2d-a1d6-6fbf1a28f33e"
  }
}

resource "aws_s3_bucket" "b_log_bucket" {
  bucket = "b-log-bucket"
}

resource "aws_s3_bucket_logging" "b" {
  bucket = aws_s3_bucket.b.id

  target_bucket = aws_s3_bucket.b_log_bucket.id
  target_prefix = "log/"
}