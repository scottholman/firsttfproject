terraform {
  required_version = "0.11.12"

  backend "gcs" {
    prefix = "terraform/bastion"

    #terraform init -backend-config="credentials=[PATH]" -backend-config="bucket=[bucket_name]"
    #bucket= ""
    #credentials = ""
  }
}

provider "google" {
  version     = "2.1"
  project     = "${var.bastion_project_id}"
  region      = "${var.region}"
  credentials = "${file(var.credentials_file)}"
}

# separate provider needed for creation of firewall rules in sharedvpc project
provider "google" {
  alias       = "shared-vpc"
  version     = "2.1"
  project     = "${var.sharedvpc_project_id}"
  region      = "${var.region}"
  credentials = "${file(var.credentials_file)}"
}