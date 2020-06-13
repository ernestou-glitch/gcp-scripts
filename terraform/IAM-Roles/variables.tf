#Variables for provider.tf file
variable "path" {default = "/home/........"}
variable "project_id" {default = "xxxxxxxx"}
variable "gcp_region" {default = "us-central1"}

#####DO NOT MODIFY####
#Add list of predifined IAM roles
variable "roles" { default = ["roles/cloudfunctions.developer",
"roles/bigquery.dataEditor",
"roles/dataflow.admin",
"roles/dataproc.admin",
"roles/storage.admin"
]}
#ADD list of desired permissions for custom role
variable "new_custom_permissions" { default = ["cloudscheduler.jobs.create",
"cloudscheduler.jobs.get",
"cloudscheduler.jobs.list",
"cloudscheduler.jobs.update",
"cloudscheduler.locations.get",
"cloudscheduler.locations.list",
"cloudscheduler.jobs.fullView"]}

