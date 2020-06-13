# Terraform works on folder level so it knows will search for important files such as provider.tf or variable.tf in the same folder where main.tf is located
# https://www.terraform.io/docs/configuration/variables.html

variable "path" {default = "/home/........"}
variable "project_id" {default = "xxxxxx"}
variable "region" {default = "us-central1"}
variable "zone" {default = "us-central1-a"}

variable "name" { default = "first-job"}
variable "temp_path" {default = "gs://dataflow-templates/latest/Word_Count"}
variable "out_path" {default = "gs://data-test-tf"}
