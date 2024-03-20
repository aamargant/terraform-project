# Store the Terraform State File in S3 and Lock with DynamoDB
terraform {
  required_version = ">= 1.7.0"
  cloud {
    organization = "arnau-ad-org"

    workspaces {
      name = "arnau-workspace-api-driven"
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
  region = var.region
}