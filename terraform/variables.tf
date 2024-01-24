variable "region" {
  type        = string
  description = "AWS region for all resources"

  default = "us-east-2"
}

variable "project_name" {
  type        = string
  description = "name of the project"

  default = "repodex"
}

# Linode Object Storage
data "linode_object_storage_cluster" "primary" {
  id = "us-east-1"
}

variable "linode_token" {
  type        = string
  description = "Linode API token"
}
