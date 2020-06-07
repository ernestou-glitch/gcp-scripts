# Terraform works on folder level so it knows will search for important files such as provider.tf or variable.tf in the same folder where main.tf is located
# https://www.terraform.io/docs/configuration/variables.html
variable "image" { default = "ubuntu-os-cloud/ubuntu-1604-lts"}
variable "machine_type" { default = "n1-standard-1"}
variable "environment" {default = "production"}
variable "machine_type_dev" {default = "n1-standard-4"}
variable "zone" { default = "us-central1-a"}
variable "name_count" {default = ["server1","server2","server3"]} #this is a variable type LIST
