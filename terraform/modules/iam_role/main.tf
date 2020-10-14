resource "google_project_iam_custom_role" "my-custom-role" {
  role_id     = "myCustomRoleBigQuery"
  title       = "My Custom Role BigQuery"
  description = "Simple BigQuery custom role"
  permissions =  var.permissions
}

resource "google_service_account" "bq-prod-service-account" {
  account_id   = "bq-prod-service-account-id"
  display_name = "bq-prod-Service Account"
}

resource "google_project_iam_binding" "new-role" {
role = "projects/${var.project_id}/roles/${google_project_iam_custom_role.my-custom-role.role_id}"
members = ["serviceAccount:${google_service_account.bq-prod-service-account.email}"]
}
