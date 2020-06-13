# https://www.terraform.io/docs/providers/google/r/storage_bucket.html
resource "google_storage_bucket" "bucket-1" {
    name = "${var.project_id}-${var.bucket_name}"
    location = "${var.bucket_location}"
    storage_class = "${var.bucket_class}"
  
    labels = {
        name = "${var.bucket_name}"
        location = "${var.bucket_location}"
    }

    versioning {
        enabled = true
    }
}

output "gs_link" {
  value = "${google_storage_bucket.bucket-1.url}"
}
