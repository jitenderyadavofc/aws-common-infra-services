// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = "~> 1.1"
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA3Y2WBELOLNCRS4NL"
  secret_key = "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"

}