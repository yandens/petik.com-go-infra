resource "google_storage_bucket" "terraform-state" {
  location                    = var.region
  name                        = var.bucket_terraform_state_cicd
  storage_class               = "STANDARD"
  force_destroy               = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  autoclass {
    enabled = true
  }
  versioning {
    enabled = true
  }
}

resource "google_service_account" "terraform-sa" {
  account_id   = var.sa_name
  display_name = "Terraform Service Account"
}

resource "google_project_iam_binding" "terraform-sa-roles" {
  project  = var.project_id
  for_each = toset(var.roles_sa_terraform)
  role     = each.value
  members  = [
    "serviceAccount:${google_service_account.terraform-sa.email}"
  ]
}

resource "google_project_iam_binding" "editor-role" {
  project = var.project_id
  role    = "roles/editor"
  members = [
    "serviceAccount:${google_service_account.terraform-sa.email}",
    "serviceAccount:${var.project_number}@cloudservices.gserviceaccount.com"
  ]
}