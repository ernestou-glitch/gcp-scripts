#the information from this file will be used to authenticate to the project
#https://www.terraform.io/docs/providers/google/index.html

variable "path" {default = "/home/ernesto_urquijo/FEDEX/credentials"}

provider "google" {
    project     = "ernestoandres2"
    region      = "us-central"
    credentials = "${file("${var.path}/secret.json")}" #Terraform will search for file secret.json in the value of path variable
}
