# The remote state of the application

terraform {
  backend "s3" {
    bucket         = "inspira-state"
    key            = "inspira/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "books"
  }
}
