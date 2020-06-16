#https://www.terraform.io/docs/providers/google/r/dataflow_job.html


resource "google_dataflow_job" "big_data_job" {
  name              = var.name
  template_gcs_path = var.template_path
  temp_gcs_location = var.temp_dir
  region = var.region
  zone = var.zone

  #Optional parameters

  # service_account_email = var.service_account
  # network = var.network
  # subnetwork = var.subnetwork
  # machine_type = var.machine_type
  # max_workers = var.max_workers
  # additional_experiments = var.additional_experiments

  #Dataflow Template parameters, example for WordCount Template
  #https://cloud.google.com/dataflow/docs/guides/templates/provided-templates#wordcount

  parameters = {
      inputFile = var.input
      output = var.output
  }
  
}
