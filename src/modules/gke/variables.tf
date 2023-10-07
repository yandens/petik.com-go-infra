variable "zone" {
  type        = string
  description = "The zone to use"
}

variable "node_zone" {
  type        = list(string)
  description = "The node zone to use"
}

variable "gke_name" {
  type        = string
  description = "The name of the GKE cluster"
  default     = "petik-cluster"
}

variable "gke_node_pool_name" {
  type        = string
  description = "The name of the GKE node pool"
  default     = "petik-node-pool"
}

variable "network_name" {
  type        = string
  description = "The name of the network"
}

variable "subnetwork_name" {
  type        = string
  description = "The name of the subnetwork"
}

variable "gke_sa_name" {
  type        = string
  description = "The service account to use"
  default     = "petik-gke-sa"
}

variable "cicd_sa_name" {
  type        = string
  description = "The service account to use"
  default     = "petik-cicd-sa"
}

variable "cluster_ipv4_cidr_block" {
  type        = string
  description = "The CIDR block to use for pod IPs"
}

variable "services_ipv4_cidr_block" {
  type        = string
  description = "The CIDR block to use for the service IPs"
}

variable "roles_sa_cicd" {
  type        = list(string)
  description = "The roles to be assigned to the service account"
  default     = ["roles/artifactregistry.admin", "roles/container.developer"]
}

variable "roles_sa_gke" {
  type        = list(string)
  description = "The roles to be assigned to the service account"
  default     = ["roles/cloudsql.client", "roles/artifactregistry.reader"]
}

variable "project_id" {
  type        = string
  description = "The project ID to use"
}

variable "gke-ingress-static-ip" {
  type        = string
  description = "The static ip for GKE ingress to use at the DNS"
  default     = "petik-gke-ip"
}