resource "google_compute_instance" "bastion" {
  #uncomment below to match the no of zones
  #count        = "${length(data.google_compute_zones.available.names)}"
  name = "${var.bastion_name}"

  machine_type = "${var.bastion_machine_type}"
  zone         = "${data.google_compute_zones.available.names[count.index]}"

  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.debian9.self_link}"
    }
  }

  network_interface {
    subnetwork = "${data.google_compute_subnetwork.bastion.self_link}"

    access_config {
      // REQUIRED TO ALLOW SSH
    }
  }

  metadata_startup_script = "${data.template_file.startup-script.rendered}"

  service_account {
    email = "${google_service_account.bastion.email}"

    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/projecthosting",
    ]
  }

  tags = [
    "remote-mgmt",
  ]

  depends_on = ["google_service_account.bastion"]
}
## test new branch hmmmm
resource "google_compute_firewall" "bastion" {
  provider    = "google.bastion-vpc"
  name        = "remote-mgmt"
  network     = "${data.google_compute_network.bastion-vpc.self_link}"
  description = "Allow inbound SSH"
  direction   = "INGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = "${var.bastion_source_cidr}"
  target_tags   = ["remote-mgmt"]
}