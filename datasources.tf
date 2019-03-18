data "google_project" "shared-vpc" {
  project_id = "${var.sharedvpc_project_id}"
}

data "google_compute_network" "shared-vpc" {
  provider = "google.shared-vpc"
  name     = "${var.sharedvpc_network}"
  project  = "${var.sharedvpc_project_id}"
}

data "google_compute_subnetwork" "bastion" {
  provider = "google.shared-vpc"
  name     = "${var.bastion_subnetwork}"
  project  = "${var.sharedvpc_project_id}"
  region   = "${var.region}"
}

data "google_client_config" "default" {}

data "google_compute_zones" "available" {
  region = "${var.region}"
}

data "template_file" "startup-script" {
  template = "${file("${format("%s/files/bastion_bootstrap.sh", path.module)}")}"
}

data "google_compute_image" "debian9" {
  family  = "debian-9"
  project = "debian-cloud"
}