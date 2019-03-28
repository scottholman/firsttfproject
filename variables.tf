variable "credentials_file" {
  type = "string"
  default = "creds/bu1-app1-dev-bac168ec7a2d.json"
}

variable "region" {
  description = "The region to host the cluster in"
  default ="europe-west2"

}

# variable "sharedvpc_project_id" {
#   type = "string"
# }

# variable "sharedvpc_network" {
#   type = "string"
# }

variable "bastion_network" {
  type = "string"
}

variable "bastion_service_account" {
  type        = "string"
  description = "Service account to associate to the bastion host"
  default = "bastion-service-account"
}

variable "bastion_project_id" {
  description = "The project ID to host the cluster in"
  default = "bu1-app1-dev"
}

variable "bastion_machine_type" {
  type = "string"
  default = "n1-standard-1"
}

variable "bastion_name" {
  type = "string"
  default = "test-server"
}

variable "bastion_subnetwork" {
  type = "string"
  default = "default"
}

variable "bastion_source_cidr" {
  type = "string"
  default = "10.154.0.0/20"
}