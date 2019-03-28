# create compute service account for bastion host
resource "google_service_account" "bastion" {
  account_id   = "${var.bastion_service_account}"
  display_name = "${var.bastion_service_account} service account"
  project      = "${var.bastion_project_id}"
}

# assign default service agent permission in service project
resource "google_project_iam_member" "bastion_serviceAgent" {
  project = "${var.bastion_project_id}"
  role    = "roles/compute.serviceAgent"
  member  = "${format("serviceAccount:%s", google_service_account.bastion.email)}"
}