variable "region" {
  type        = string
  description = "AWS region for all resources"

  default = "us-east-2"
}

variable "linode_region" {
  type        = string
  description = "Linode region for all resources"

  default = "us-east-2"
}

variable "project_name" {
  type        = string
  description = "name of the project"

  default = "repodex"
}

variable "linode_token" {
  type        = string
  description = "Linode API token"
}
