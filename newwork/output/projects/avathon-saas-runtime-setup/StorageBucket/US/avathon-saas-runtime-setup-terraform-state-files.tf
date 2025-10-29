resource "google_storage_bucket" "avathon_saas_runtime_setup_terraform_state_files" {
  force_destroy = false

  labels = {
    goog-terraform-provisioned = "true"
    managed-by-cnrm            = "true"
  }

  location                 = "US"
  name                     = "avathon-saas-runtime-setup-terraform-state-files"
  project                  = "avathon-saas-runtime-setup"
  public_access_prevention = "enforced"

  soft_delete_policy {
    retention_duration_seconds = 604800
  }

  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}
# terraform import google_storage_bucket.avathon_saas_runtime_setup_terraform_state_files avathon-saas-runtime-setup-terraform-state-files
