#Variables for provider.tf file
variable "path" {default = "/home/......."}
variable "project_id" {default = "xxxxxx"}
variable "gcp_region" {default = "us-central1"}
#Variables for main.tf
variable "bucket_name" { default = "my-very-first-bucket"}
variable "bucket_location" { default = "us-central1"}
variable "bucket_class" {default = "REGIONAL"}
