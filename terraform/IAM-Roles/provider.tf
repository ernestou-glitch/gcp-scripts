#the information from this file will be used to authenticate to the project
#https://www.terraform.io/docs/providers/google/index.html

provider "google" {
    project     = "${var.project_id}"
    region      = "${var.gcp_region}"
    credentials = "${file("${var.path}/secret.json")}" #Terraform will search for file secret.json in the value of path variable
}
