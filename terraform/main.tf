terraform {
  required_version = "~> 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~
# Lambda function
#~~~~~~~~~~~~~~~~~~~~~~~~~~
module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name              = "${var.service_name}-lambda"
  description                = "Lambda function for ${var.service_name}"
  runtime                    = "provided.al2"
  architectures              = ["arm64"]
  handler                    = "bootstrap"
  create_lambda_function_url = true
  authorization_type         = "NONE" # change to "AWS_IAM" to enable IAM-based access to the function
  cors = {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "POST", "PUT", "DELETE", "HEAD", "OPTIONS"]
    allowed_origins = ["*"]
  }

  create_package         = false
  local_existing_package = "../lambdas/repodex/target/lambda/repodex/bootstrap.zip"
}

# this data source can be used to get the access to the effective Account ID, User ID, and ARN in which Terraform is authorized 
data "aws_caller_identity" "current" {}
