terraform {
  backend "s3" {
    bucket         = "vishal-terraform-state-d27ea46a"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "vishal-terraform-locks"
    encrypt        = true
  }
}
