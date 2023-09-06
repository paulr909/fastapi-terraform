terraform {
  backend "http" {
  }

  #   backend "remote" {
  #    organization = "paul-codes"
  #
  #    workspaces {
  #      name = "fastapi-app-prod"
  #    }
  #  }
}

provider "aws" {
  region = var.region
}
