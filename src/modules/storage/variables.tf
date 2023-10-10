variable "bucket_terraform_state_cicd" {
  type        = string
  description = "Name for the bucket"
  default     = "state-petik"
}

variable "region" {
  type        = string
  description = "Region for the bucket"
}

variable "sa_name" {
  type        = string
  description = "Name for the service account"
  default     = "terraform-state-cicd"
}

variable "roles_sa_terraform" {
  type        = list(string)
  description = "The roles to be assigned to the service account"
  default     = ["roles/editor", "roles/resourcemanager.projectIamAdmin", "roles/servicenetworking.networksAdmin",  "roles/iam.serviceAccountUser"]
}

variable "project_id" {
  type        = string
  description = "The project ID to use"
}
