terraform {
  required_version = "~> 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
    linode = {
      source  = "linode/linode"
      version = "~> 2.5.2"
    }
  }
}
