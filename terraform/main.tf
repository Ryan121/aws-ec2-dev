terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "RS-terraform"

    workspaces {
      name = "ec2-dev"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">4.33.0"
    }
  }
}