#Variables for provider.tf file
variable "path" {default = "/home/ernesto_urquijo/FEDEX/credentials"}
variable "project_id" {default = "ernestoandres2"}
variable "gcp_region" {default = "us-central1"}

#ADD list of desired permissions for compute engine custom role
variable "permissions" { default = ["compute.instances.list",
"compute.instances.reset",
"compute.acceleratorTypes.get",
"compute.acceleratorTypes.list",
"compute.instances.start",
"compute.instances.stop",
"compute.instances.suspend",
"compute.instances.use",
"iam.serviceAccounts.actAs",
"iam.serviceAccounts.get",
"iam.serviceAccounts.list"]}

#ADD list of desired permission for BQ custom roles