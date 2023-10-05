terraform {
  backend "gcs" {
    bucket  = "bucket-state-terraform-cicd"
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
}

resource "google_storage_bucket" "terraform_cicd_state" {
  name          = "bucket-state-terraform-cicd"
  location      = var.region
  force_destroy = false
  public_access_prevention = "enforced"
}

module "vpc" {
  source = "./modules/network"
  region = var.region
}