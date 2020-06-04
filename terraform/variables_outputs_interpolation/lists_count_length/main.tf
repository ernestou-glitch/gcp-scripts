#Creates instance with a single PD disk
# https://www.terraform.io/docs/providers/google/r/compute_instance.html
resource "google_compute_instance" "default" {
count = "${length(var.name_count)}" #number of members in variable name_count
name         = "list-${count.index+1}"
machine_type = "${var.machine_type}"
zone         = "${var.zone}"

boot_disk {
    initialize_params {
        image = "${var.image}"
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

# https://www.terraform.io/docs/configuration/outputs.html
#the * is so we can print the output for all instances
output "machine_type" { value = "${google_compute_instance.default.*.machine_type}" }
output "zone" {value = "${google_compute_instance.default.*.zone}"}
output "name" { value = "${google_compute_instance.default.*.name}"}
