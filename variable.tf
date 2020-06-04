
variable "roles" { default = ["roles/cloudfunctions.developer",
"roles/bigquery.dataEditor",
"roles/dataflow.admin",
"roles/dataproc.admin",
"roles/storage.admin"
]}
#ADD list of desired permissions for custom role
variable "scheduler_custom_permissions" { default = ["cloudscheduler.jobs.create",
"cloudscheduler.jobs.get",
"cloudscheduler.jobs.list",
"cloudscheduler.jobs.update",
"cloudscheduler.locations.get",
"cloudscheduler.locations.list",
"cloudscheduler.jobs.fullView"]}
