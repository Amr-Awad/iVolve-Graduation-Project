//configure s3 bucket as backend for tfstate 
terraform {
  backend "s3" {
    bucket = "ivolve-terraform-shared-state-1"
    key    = "project/sharedState.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}