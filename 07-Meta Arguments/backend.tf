terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-day08"
    key    = "dev/terraform.tfstate"           
    region = "ca-central-1"                    

  }
}
