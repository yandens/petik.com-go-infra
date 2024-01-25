terraform {
  backend "gcs" {
    bucket  = "state-terraform-1086"
    prefix  = "terraform/state"
    credentials = "../.secret/credentials.json"
  }

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.64.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
  credentials = "../.secret/credentials.json"
}

resource "google_project_service" "service" {
  project   = var.project_id
  for_each  = toset(var.services)
  service   = each.value
}

module "vpc" {
  source = "./modules/network"
  region = var.region
  depends_on = [google_project_service.service]
}

#module "gke" {
#  source = "./modules/gke"
#  project_id               = var.project_id
#  zone                     = var.zone
#  node_zone                = var.cluster_node_zone
#  network_name             = module.vpc.network.name
#  subnetwork_name          = module.vpc.subnet.name
#  cluster_ipv4_cidr_block  = "10.101.0.0/20"
#  services_ipv4_cidr_block = "10.102.0.0/20"
#  depends_on = [google_project_service.service]
#}

module "bucket" {
  source = "./modules/storage"
  project_id = var.project_id
  region = var.region
  project_number = var.project_number
}

#module "database" {
#  source = "./modules/database"
#  region                     = var.region
#  network                    = module.vpc.network.id
#  network_private_connection = module.vpc.private_ip_connection.id
#  depends_on = [google_project_service.service]
#}
#
#module "artifact" {
#  source = "./modules/artifact-registry"
#  region = var.region
#  depends_on = [google_project_service.service]
#}