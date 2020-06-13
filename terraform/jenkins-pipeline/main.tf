#create static ip
# https://www.terraform.io/docs/providers/google/r/compute_address.html
resource "google_compute_address" "static" {
  name = "jenkins-ipv4-address"
}

#Creates instance with a single PD disk
# https://www.terraform.io/docs/providers/google/d/datasource_compute_instance.html
resource "google_compute_instance" "default" {
name         = "jenkins-terraform-vm"
machine_type = "${var.machine_type}"
zone         = "${var.zone}"

can_ip_forward = false
description = "This is our Virtual Machine with Jenkis to do a CI/CD pipeline"
    tags = ["allow-http-tag","allow-https-tag"] #FIREWALL tags

boot_disk {
    initialize_params {
        image = "${var.image}"
        size = "20"
    }
}

#puts instance in default VPC and attachs static ip
network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

#metadata and startup scripts
#install jenkins may take 10min go to your browser external-ip:8080
#password for admin: cat /var/lib/jenkins/secrets/initialAdminPassword

metadata_startup_script =  <<EOF
sudo apt update -y
sudo apt install -y openjdk-8-jdk
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo ufw allow 8080
sudo ufw allow 80
sudo ufw allow 22
EOF

#Not mandatory for simple instance but nice to have
service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
}

depends_on = [google_compute_address.static]

}
