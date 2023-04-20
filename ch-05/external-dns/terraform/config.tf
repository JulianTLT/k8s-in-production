terraform {
  backend "s3" {
    bucket         = "jsanchez-clusters-terraform-state"
    key            = "clusters_external_dns.tfstate"
    region         = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}