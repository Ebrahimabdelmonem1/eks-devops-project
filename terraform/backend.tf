terraform {
  backend "s3" {
    bucket = "devops-platform-terraform-state-ebrahim"
    key    = "terraform/devops-platform/terraform.tfstate"
    region = "us-east-1"
  }
}