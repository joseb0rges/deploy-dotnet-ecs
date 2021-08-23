
locals {
  AWS_DEFAULT_REGION = "us-east-1"
  AWS_VPC_ID         = "vpcid"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = local.AWS_DEFAULT_REGION
  access_key = ""
  secret_key = ""
}

# Read a VPC
data "aws_vpc" "vpc_selected" {
  id = local.AWS_VPC_ID
}
