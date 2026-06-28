resource "google_service_account" "saas_service_account" {
  account_id   = "saas-service-account"
  display_name = "saas-service-account"
  project      = "avathon-saas-runtime-setup"
}
# terraform import google_service_account.saas_service_account projects/avathon-saas-runtime-setup/serviceAccounts/saas-service-account@avathon-saas-runtime-setup.iam.gserviceaccount.com
