#the information from this file will be used to authenticate to the project
#https://www.terraform.io/docs/providers/google/index.html

provider "google" {
    credentials = "${file("${var.path}/secret.json")}" #Terraform will search for file secret.json in the value of path variable
    scopes = ["https://www.googleapis.com/auth/drive","https://www.googleapis.com/auth/bigquery"] 
    #you need to add the scopes for Drive and Bigquery in addition to do the Oauth consent in your GCP project and add the scopes there
    project     = "${var.project_id}"
    region      = "${var.gcp_region}"
}
