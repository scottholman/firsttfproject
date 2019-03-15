variable "credentials_file" {
  type = "string"
}

variable "region" {
  description = "The region to host the cluster in"
}

variable "sharedvpc_project_id" {
  type = "string"
}

variable "sharedvpc_network" {
  type = "string"
}

variable "bastion_service_account" {
  type        = "string"
  description = "Service account to associate to the bastion host"
}

variable "bastion_project_id" {
  description = "The project ID to host the cluster in"
}

variable "bastion_machine_type" {
  type = "string"
}

variable "bastion_name" {
  type = "string"
}

variable "bastion_subnetwork" {
  type = "string"
}

variable "bastion_source_cidr" {
  type = "list"
}