# Store the Terraform State File in S3 and Lock with DynamoDB
terraform {
  cloud {
    organization = "arnau-ad-org"

    workspaces {
      name = "arnau-workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

provider "aws" {
  shared_config_files      = [".aws/config"]
  shared_credentials_files = [".aws/credentials"]
  profile                  = "default"
}