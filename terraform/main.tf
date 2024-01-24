provider "aws" {
  region = var.aws_region
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~
# Lambda function
#~~~~~~~~~~~~~~~~~~~~~~~~~~
module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name              = "${var.project_name}-lambda"
  description                = "Lambda function for ${var.project_name}"
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

provider "linode" {
  token = var.linode_token
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~
# Linode Object Storage
#~~~~~~~~~~~~~~~~~~~~~~~~~~
resource "linode_object_storage_bucket" "repodex-bucket" {
  cluster      = var.linode_region
  label        = "${var.project_name}-bucket"
  acl          = "public-read-write"
  cors_enabled = true
}
