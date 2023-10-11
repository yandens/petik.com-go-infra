variable "project_id" {
  type        = string
  description = "Project ID from Google Cloud Console"
}

variable "project_number" {
  type        = string
  description = "Project Number from Google Cloud Console"
}

variable "region" {
  type        = string
  description = "Region to Deploy the Infrastructure"
}

variable "zone" {
  type        = string
  description = "Zone to Deploy the Infrastructure"
}

variable "cluster_node_zone" {
  type = list(string)
  description = "Zone to Deploy the Kubernetes Cluster"
}

variable "services" {
  type = list(string)
  description = "Services to Deploy"
  default = [
    "compute.googleapis.com", "artifactregistry.googleapis.com", "sqladmin.googleapis.com", "iam.googleapis.com",
    "container.googleapis.com", "cloudresourcemanager.googleapis.com", "servicenetworking.googleapis.com"
  ]
}