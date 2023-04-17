terraform {
  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "jsanchez-clusters-vpc-terraform-state"
    key            = "clusters-vpc.tfstate"
    region         = "us-east-1"
    dynamodb_table = "jsanchez-clusters-vpc-tf-lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}
