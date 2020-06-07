#Creates instance with a single PD disk
# https://www.terraform.io/docs/providers/google/d/datasource_compute_instance.html
resource "google_compute_instance" "default" {
count = 1
name         = "server-${count.index+1}"
machine_type = "${var.environment != "dev" ? var.machine_type : var.machine_type_dev}"
zone         = var.zone

can_ip_forward = false
description = "This is our Virtual Machine with FW rules"
    tags = ["allow-http-tag","allow-https-tag"] #FIREWALL tags

boot_disk {
    initialize_params {
        image = "${var.image}"
        size = "20"
    }
}

#standard GCP labels
labels = {
    name = "server-${count.index+1}"
    machine_type = "${var.environment != "dev" ? var.machine_type : var.machine_type_dev}"
}

#puts instance in default VPC
network_interface {
    network = "default"
}

#metadata and startup scripts
metadata = {
    size = "20"
    foo = "bar"
}

metadata_startup_script = "echo hi > /tmp/test"

#Not mandatory for simple instance but nice to have
service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
}

}

# https://www.terraform.io/docs/providers/google/r/compute_disk.html
resource "google_compute_disk" "additional" {
  name  = "test-disk"
  type  = "pd-ssd"
  zone  = var.zone
  size = "10"
}

# https://www.terraform.io/docs/providers/google/r/compute_attached_disk.html
#attribiuter self_link indicates Terraform to look for resources created in this file
resource "google_compute_attached_disk" "default" {
    disk = "${google_compute_disk.additional.self_link}"
    instance = google_compute_instance.default[0].self_link #because instance resource has a "count" attribute we have to indicate is the first one : 0,1,2,3,...
}
