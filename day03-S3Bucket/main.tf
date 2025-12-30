terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create S3 Bucket 
resource "aws_s3_bucket" "demo_bucket"{
    bucket = "terraformtutorials-husseinmajed-2025" 
    tags ={
      Name = "My Bucket 2.0"
      Environment = "Dev"
    }
}