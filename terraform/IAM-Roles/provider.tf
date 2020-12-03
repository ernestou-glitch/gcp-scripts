#the information from this file will be used to authenticate to the project
#https://www.terraform.io/docs/providers/google/index.html

provider "google" {
    project     = var.project_id
    region      = var.gcp_region
}
