# Terraform works on folder level so it knows will search for important files such as provider.tf or variable.tf in the same folder where main.tf is located
# https://www.terraform.io/docs/configuration/variables.html

variable "path" {default = "/home/........"}
variable "project_id" {default = "xxxxxxx"}
variable "region" {default = "us-central1"}
