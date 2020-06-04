  
# Terraform works on folder level so it knows will search for important files such as provider.tf or variable.tf in the same folder where main.tf is located
# https://www.terraform.io/docs/configuration/variables.html
variable "image" { default = "ubuntu-os-cloud/ubuntu-1604-lts"}
variable "machine_type" { 
    type = "map"
    default = {
    "dev" = "n1-standard-1"
    "prod" = "production_box_wont_work"
    } #variable type MAP in your main.tf file you need to specify to which value you are going to map it
    #var.machine_type["dev"]
    #var.machine_type["prod"]
}
variable "zone" { default = "us-central1-a"}
variable "name_count" {default = ["server1","server2","server3"]} #this is a variable type LIST