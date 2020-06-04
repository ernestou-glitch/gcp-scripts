#Creates instance with a single PD disk
# https://www.terraform.io/docs/providers/google/r/compute_instance.html
resource "google_compute_instance" "default" {
count = 1
name         = "first"
machine_type = "${var.machine_type["dev"]}" #mapping to the value of dev in variable machine_type
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

resource "google_compute_instance" "second" {
count = 1
name         = "second"
machine_type = "${var.machine_type["dev"]}" #mapping to the value of dev in variable machine_type
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
# https://www.terraform.io/docs/configuration/resources.html#depends_on-explicit-resource-dependencies
# resource "second" will not be created until "default" is created eg if "default" cannot be created then "second" will not trigger.
#You can also move the depends_on argument to the first resource
depends_on = [google_compute_instance.default]
}
# https://www.terraform.io/docs/configuration/outputs.html
#the * is so we can print the output for all instances
output "machine_type" { value = "${google_compute_instance.default.machine_type}" }
output "zone" {value = "${google_compute_instance.default.zone}"}
output "name" { value = "${google_compute_instance.default.name}"}
# "," is the delimeter you can change it for other character
# join (delimenter , list)
output "instance_id" {value = "${google_compute_instance.default.instance_id}"}
