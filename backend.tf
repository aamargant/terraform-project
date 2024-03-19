# Store the Terraform State File in S3 and Lock with DynamoDB
terraform {
  backend "s3" {
    bucket         = "terraform-tfstate-test-arnau"
    key            = "terraform-tfstate-test-arnau/aws-vpc/terraform.tfstate"
    region         = "us-east-2"
    profile        = "terraform-user"
    dynamodb_table = "terraform-locks"
  }
}