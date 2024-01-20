variable "region" {
  type        = string
  description = "AWS region for all resources"

  default = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "name of the project"

  default = "my-project"
}
