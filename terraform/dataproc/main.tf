# https://www.terraform.io/docs/providers/google/r/dataproc_cluster.html

resource "google_dataproc_cluster" "mycluster" {
  name     = "terraform-test"
  region   = "us-central1"


  cluster_config {

    master_config {
      num_instances = 1
      machine_type  = "n1-standard-1"
      disk_config {
        boot_disk_type    = "pd-ssd"
        boot_disk_size_gb = 15
      }
    }

    worker_config {
      num_instances    = 2
      machine_type     = "n1-standard-1"
      min_cpu_platform = "Intel Skylake"
      disk_config {
        boot_disk_size_gb = 15
        num_local_ssds    = 1
      }
    }

    preemptible_worker_config {
      num_instances = 0
    }

    # Override or set some custom properties
    software_config {
      image_version = "1.3.7-deb9"
      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
      }
    }

    gce_cluster_config {
      service_account_scopes = [
        "https://www.googleapis.com/auth/monitoring",
        "useraccounts-ro",
        "storage-rw",
        "logging-write",
      ]
    }

    # You can define multiple initialization_action blocks
    initialization_action {
      script      = "gs://dataproc-initialization-actions/stackdriver/stackdriver.sh"
      timeout_sec = 500
    }
  }
}

# Submit an example spark job to a dataproc cluster
# https://www.terraform.io/docs/providers/google/r/dataproc_job.html
resource "google_dataproc_job" "spark" {
  region       = google_dataproc_cluster.mycluster.region
  force_delete = true
  placement {
    cluster_name = google_dataproc_cluster.mycluster.name
  }

  spark_config {
    main_class    = "org.apache.spark.examples.SparkPi"
    jar_file_uris = ["file:///usr/lib/spark/examples/jars/spark-examples.jar"]
    args          = ["1000"]

    properties = {
      "spark.logConf" = "true"
    }

    logging_config {
      driver_log_levels = {
        "root" = "INFO"
      }
    }
  }
}

# Check out current state of the jobs
output "spark_status" {
  value = google_dataproc_job.spark.status[0].state
}