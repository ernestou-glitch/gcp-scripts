
resource "google_storage_bucket" "bucket" {
  name = "${var.project_id}-functions-bucket"
}

# We are putting the code into a bucket that will be pulled when we create the function.
resource "google_storage_bucket_object" "archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.bucket.name
  source = var.python_code #path to file which contains code , must be in the same machine
}

# https://www.terraform.io/docs/providers/google/r/cloudfunctions_function.html

resource "google_cloudfunctions_function" "function" {
  name        = var.function_name
  description =  var.function_name
  runtime     = var.languaje

  available_memory_mb   = var.memory_size
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "helloGET"
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
