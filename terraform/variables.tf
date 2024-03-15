variable "aws_region" {
  type        = string
  description = "AWS region for all resources"

  default = "us-east-2"
}

variable "service_name" {
  type        = string
  description = "name of the project"

  default = "repodex"
}
