resource "google_storage_bucket" "terraform-state" {
  location                    = var.region
  name                        = var.bucket_terraform_state
  storage_class               = "STANDARD"
  force_destroy               = false
  uniform_bucket_level_access = true
  autoclass {
    enabled = true
  }
  versioning {
    enabled = true
  }
}

resource "google_service_account" "state-sa" {
  account_id   = var.sa_name
  display_name = "Terraform State Service Account"
}

resource "google_project_iam_binding" "bucket-sa-roles" {
  project  = var.project_id
  for_each = toset(var.roles_sa_bucket)
  role     = each.value
  members  = [
    "serviceAccount:${google_service_account.state-sa.email}"
  ]
}
