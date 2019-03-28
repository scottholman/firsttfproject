terraform {
  required_version = "0.11.13"

 backend "gcs" {
    prefix = "terraform/bastion"
    #terraform init -backend-config="credentials=[PATH]" -backend-config="bucket=[bucket_name]"
    bucket= "thisisthetestbucket"
    credentials = "creds/bu1-app1-dev-bac168ec7a2d.json"
  }
}

provider "google" {
  alias       = "bastion-vpc"
  version     = "2.1"
  project     = "${var.bastion_project_id}"
  region      = "${var.region}"
  credentials = "${file(var.credentials_file)}"
}

provider "google" {
  alias       = "shared-vpc"
  version     = "2.1"
  project     = "${var.bastion_project_id}"
  region      = "${var.region}"
  credentials = "${file(var.credentials_file)}"
}

provider "google" {
  alias       = "bastion"
  version     = "2.1"
  project     = "${var.bastion_project_id}"
  region      = "${var.region}"
  credentials = "${file(var.credentials_file)}"
}

# # separate provider needed for creation of firewall rules in sharedvpc project
# provider "google" {
#   alias       = "shared-vpc"
#   version     = "2.1"
#   project     = "${var.sharedvpc_project_id}"
#   region      = "${var.region}"
#   credentials = "${file(var.credentials_file)}"
# }