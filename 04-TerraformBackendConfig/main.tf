terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
    backend "s3" {
    bucket = "terraformpractice-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = "terraformpractice-terraform-lock"
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