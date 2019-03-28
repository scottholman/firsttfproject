# output "bastion_ip" {
#   value = "${google_compute_instance.bastion.network_interface.0.access_config.0.nat_ip}"
# }

# output "bastion_sa" {
#   value = "${google_service_account.bastion.email}"
# }

# output "bastion_sa_role" {
#   value = "${google_project_iam_member.bastion_serviceAgent.role}"
# }