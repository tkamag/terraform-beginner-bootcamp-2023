terraform {


    cloud {
        organization = "kamagne"
        workspaces {
          name = "terra-house-tka"
        }
      }
    required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  length           = 32
  special          = false
  lower = true
  upper = false
  #override_special = "/@£$"
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


output "random_bucket_name" {
  value = random_string.bucket_name.id
}