variable "bucket_terraform_state" {
  type        = string
  description = "Name for the bucket"
  default     = "terraform-state-petik.com"
}

variable "region" {
  type        = string
  description = "Region for the bucket"
}

variable "sa_name" {
  type        = string
  description = "Name for the service account"
  default     = "terraform-state"
}

variable "roles_sa_bucket" {
  type        = list(string)
  description = "The roles to be assigned to the service account"
  default     = ["roles/storage.objectUser"]
}

variable "project_id" {
  type        = string
  description = "The project ID to use"
}
