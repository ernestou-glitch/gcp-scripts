#Creates instance with a single PD disk
# https://www.terraform.io/docs/providers/google/d/datasource_compute_instance.html
resource "google_compute_instance" "default" {
name         = "test-vm"
machine_type = "n1-standard-1"
zone         = "us-central1-a"

boot_disk {
    initialize_params {
        image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
}

#puts instance in default VPC
network_interface {
    network = "default"
}

#Not mandatory for simple instance but nice to have
service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
}

}
