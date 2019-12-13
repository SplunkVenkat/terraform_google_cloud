resource "google_compute_instance" "appserver-1" {
  name         = "public-server-vm"
  machine_type = "f1-micro"
  zone         = "${var.zone}"
  tags = ["ssh"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.subnet-public.name
    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_instance" "appserver-2" {
  name         = "private-server-vm"
  machine_type = "f1-micro"
  zone         = "${var.zone}"
  tags = ["ssh"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.subnet-private.name
  }
}
