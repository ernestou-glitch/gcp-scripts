# Terraform works on folder level so it knows will search for important files such as provider.tf or variable.tf in the same folder where main.tf is located
# https://www.terraform.io/docs/configuration/variables.html

variable "path" {default = "/home/......."}
variable "project_id" {default = "xxxxxxxx"}
variable "region" {default = "us-west2"}
variable "zone" {default = "us-west2-a"}

variable "topic_name" {default = "terraform-topic"}
variable "schedule_name" {default = "terraform-job"}
variable "schedule" { default = "*/2 * * * *"}
