terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  #   backend "s3" {
  #       # Replace this with your bucket name!
  #       bucket         = "terraform-state-lennar-infra"
  #       key            = "infra_services.tfstate"
  #       region         = "us-east-1"
  #   }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA3Y2WBELOLNCRS4NL"
  secret_key = "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"
}
