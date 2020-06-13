# Terraform works on folder level so it knows will search for important files such as provider.tf or variable.tf in the same folder where main.tf is located
# https://www.terraform.io/docs/configuration/variables.html

variable "path" {default = "/home/ernesto_urquijo/credentials"}
variable "project_id" {default = "ernestoandres2"}
variable "region" {default = "us-central1"}

variable "python_code" {default = "/home/ernesto_urquijo/functions/hello_world/"}
variable "function_name" {default = "terraform-function"}
variable "languaje" {default = "python37"}
variable "memory_size" {default = "128"}
variable "folder_path" { default = "/home/ernesto_urquijo/functions/hello_world"}



"${var.path}/secret.json"