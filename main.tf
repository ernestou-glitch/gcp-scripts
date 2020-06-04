#Create custom roles
# https://www.terraform.io/docs/providers/google/r/google_project_iam_custom_role.html

resource "google_project_iam_custom_role" "scheduler-custom-role" {
  role_id     = "scheduler_custom"
  title       = "DEV Scheduler Role"
  description = "Cloud Scheduler Jobs custom role"
  permissions = "${var.scheduler_custom_permissions}"
}

#Create SA
#https://www.terraform.io/docs/providers/google/r/google_service_account.html
resource "google_service_account" "data-hulks-dev-sa" {
  account_id   = "data-hulks-dev-sa"
  display_name = "data-hulks-dev-sa"
}

#Add custom role to SA
# https://www.terraform.io/docs/providers/google/r/google_project_iam.html#google_project_iam_binding

resource "google_project_iam_binding" "new-roles" {
role = "projects/${var.project_id}/roles/${google_project_iam_custom_role.scheduler-custom-role.role_id}"
members = ["serviceAccount:${google_service_account.data-hulks-dev-sa.email}"]
}

#Add predefined roles to SA in a for_each loop
# https://blog.gruntwork.io/terraform-tips-tricks-loops-if-statements-and-gotchas-f739bbae55f9

resource "google_project_iam_binding" "predifined-roles" {
for_each = toset(var.roles)
role = each.value
members = ["serviceAccount:${google_service_account.data-hulks-dev-sa.email}"]
}

#Display SA address
output "service_account_email" {
  value = "${google_service_account.data-hulks-dev-sa.email}"
}

#Display name of custom role
output "role_id" {
value = "${google_project_iam_custom_role.scheduler-custom-role.role_id}"
}
