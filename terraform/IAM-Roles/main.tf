#Create custom roles
# https://www.terraform.io/docs/providers/google/r/google_project_iam_custom_role.html

resource "google_project_iam_custom_role" "new-custom-role" {
  role_id     = "new_custom"
  title       = "DEV new Role"
  description = "Cloud new Jobs custom role"
  permissions = "${var.new_custom_permissions}"
}

#Create SA
#https://www.terraform.io/docs/providers/google/r/google_service_account.html
resource "google_service_account" "new-sa" {
  account_id   = "new-sa"
  display_name = "new-sa"
}

#Add custom role to SA
# https://www.terraform.io/docs/providers/google/r/google_project_iam.html#google_project_iam_binding

resource "google_project_iam_binding" "new-roles" {
role = "projects/${var.project_id}/roles/${google_project_iam_custom_role.new-custom-role.role_id}"
members = ["serviceAccount:${google_service_account.new.email}"]
}

#Add predefined roles to SA in a for_each loop
# https://blog.gruntwork.io/terraform-tips-tricks-loops-if-statements-and-gotchas-f739bbae55f9

resource "google_project_iam_binding" "predifined-roles" {
for_each = toset(var.roles)
role = each.value
members = ["serviceAccount:${google_service_account.new-sa.email}"]
}

#Display SA address
output "service_account_email" {
  value = "${google_service_account.new-sa.email}"
}

#Display name of custom role
output "role_id" {
value = "${google_project_iam_custom_role.new-custom-role.role_id}"
}
