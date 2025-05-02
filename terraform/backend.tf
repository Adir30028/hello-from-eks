terraform {
  backend "s3" {
    bucket         = "adir-task-1"
    key            = "terraform/eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "task1-table"
    encrypt        = true
  }
}
