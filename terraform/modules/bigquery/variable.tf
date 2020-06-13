#Variables for provider.tf file
variable "path" {default = "/home/................"}
variable "project_id" {default = "xxxxxxxxxxxxx"}
variable "gcp_region" {default = "us-central1"}

#ADD list of desired permissions for bigquery custom role
variable "permissions" { default = ["bigquery.connections.get",
"bigquery.connections.getIamPolicy",
"bigquery.connections.list",
"bigquery.connections.use",
"bigquery.datasets.create",
"bigquery.datasets.get",
"bigquery.datasets.getIamPolicy",
"bigquery.datasets.updateTag",
"bigquery.tables.create",
"bigquery.tables.delete",
"bigquery.tables.export",
"bigquery.tables.get",
"bigquery.tables.getData",
"bigquery.tables.getIamPolicy",
"bigquery.tables.list",
"bigquery.tables.update",
"bigquery.tables.updateData",
"bigquery.tables.updateTag"]}
