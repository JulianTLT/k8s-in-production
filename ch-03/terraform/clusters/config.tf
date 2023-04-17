terraform {
  backend "s3" {
    bucket         = "jsanchez-clusters-terraform-state"
    key            = "clusters.tfstate"
    region         = "us-east-1"
    dynamodb_table = "jsanchez-clusters-tf-lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}