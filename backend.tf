terraform {
  backend "s3" {
    bucket         = "shady-terraform-state"
    key            = "3tier-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_locks_shady"
    encrypt        = true
  }
}
