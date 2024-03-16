terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-545646"
    key            = "tfstate/state"
    region         = "us-east-2"
    dynamodb_table = "MyLockTablenNew"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}