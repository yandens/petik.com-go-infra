terraform {
  backend "gcs" {
    bucket  = "terraform-state-petik"
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

module "vpc" {
  source = "./modules/network"
  region = var.region
}

module "gke" {
  source = "./modules/gke"
  project_id               = var.project_id
  zone                     = var.zone
  node_zone                = var.cluster_node_zone
  network_name             = module.vpc.network.name
  subnetwork_name          = module.vpc.subnet.name
  cluster_ipv4_cidr_block  = "10.101.0.0/20"
  services_ipv4_cidr_block = "10.102.0.0/20"
}

module "bucket" {
  source = "./modules/storage"
  project_id = var.project_id
  region = var.region
}

#module "database" {
#  source = "./modules/database"
#  region                     = var.region
#  network                    = module.vpc.network.id
#  network_private_connection = module.vpc.private_ip_connection.id
#}

module "artifact" {
  source = "./modules/artifact-registry"
  region = var.region
}

resource "google_service_account" "test" {
  account_id = "TerraformSATest123"
  display_name = "Terraform Service Account Test"
}