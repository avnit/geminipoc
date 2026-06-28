resource "google_service_account" "341534251420_compute" {
  account_id   = "341534251420-compute"
  display_name = "Compute Engine default service account"
  project      = "avathon-saas-runtime-setup"
}
# terraform import google_service_account.341534251420_compute projects/avathon-saas-runtime-setup/serviceAccounts/341534251420-compute@avathon-saas-runtime-setup.iam.gserviceaccount.com
