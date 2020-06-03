#Create custom roles
# https://www.terraform.io/docs/providers/google/r/google_project_iam_custom_role.html

resource "google_project_iam_custom_role" "my-custom-role" {
  role_id     = "myCustomRoleBigQuery"
  title       = "My Custom Role BigQuery"
  description = "Simple BigQuery custom role"
  permissions = "${var.permissions}"
}

#Create SA
#https://www.terraform.io/docs/providers/google/r/google_service_account.html
resource "google_service_account" "bq-prod-service-account" {
  account_id   = "bq-prod-service-account-id"
  display_name = "bq-prod-Service Account"
}

#Add custom role to SA
# https://www.terraform.io/docs/providers/google/r/google_project_iam.html#google_project_iam_binding

resource "google_project_iam_binding" "new-role" {
role = "projects/${var.project_id}/roles/${google_project_iam_custom_role.my-custom-role.role_id}"
members = ["serviceAccount:${google_service_account.bq-prod-service-account.email}"]
}



#Display SA address
output "service_account_email" {
  value = "${google_service_account.bq-prod-service-account.email}"
}

#Display name of custom role
output "role_id" {
value = "${google_project_iam_custom_role.my-custom-role.role_id}"
}

