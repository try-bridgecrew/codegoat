resource "aws_s3_bucket" "b" {
  bucket = "prisma-cloud-code-security-test-bucket-jm"

  tags = {
    Name        = "My PCCS test bucket"
    Environment = "Prod"
  }
}