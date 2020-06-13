# Terraform works on folder level so it knows will search for important files such as provider.tf or variable.tf in the same folder where main.tf is located
# https://www.terraform.io/docs/configuration/variables.html
variable "path" {default = "/home/......"}
variable "project_id" {default = "xxxxxx"}
variable "gcp_region" {default = "us-central1"}

variable "image" { default = "ubuntu-os-cloud/ubuntu-1804-lts"}
variable "machine_type" { default = "n1-standard-1"}
variable "environment" {default = "prod"}
variable "zone" { default = "us-central1-a"}
