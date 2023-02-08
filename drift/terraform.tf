terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.4.0"
    }
  }
  backend "remote" {
    organization = "jmcguigan"
    workspaces {
      name = "terraform-aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
  #access_key = "AKIAIOSFODNN7EXAMPLE"
  #secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}