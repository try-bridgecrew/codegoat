terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.4.0"
    }
  }
  backend "s3" {
    region = "us-east-1"
    bucket = "codegoat-terraform-state-jenkins"
    key = "remote.tfstate"
  }
}

provider "aws" {
  region = var.aws_region
  #access_key = "AKIAIOSFODNN7EXAMPLE"
  #secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}