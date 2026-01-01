terraform {
    backend "s3" {
    bucket = "terraformpractice-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = "terraformpractice-terraform-lock"
  }
}