#https://www.terraform.io/docs/providers/google/r/dataflow_job.html


resource "google_dataflow_job" "big_data_job" {
  name              = var.name
  template_gcs_path = var.temp_path
  temp_gcs_location = var.out_path
  zone = var.zone
  parameters = {
      status = "new"
      iteration = "fisrt"
      environment = "test"
  }
  
}
