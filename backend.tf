terraform {
  backend "s3" {
    bucket         = "talent-academy-5609802262-tfstates"
    key            = "ta-training/ansible-training/training-terraform/terraform.tfstates"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}