terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         = "fastapi-app-tfstate"
    key            = "state/terraform.tfstate"
    region         = var.region
    encrypt        = true
    dynamodb_table = "fastapi-app_tf_lockid"
  }
}

provider "aws" {
  region = var.region
}
