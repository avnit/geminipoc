resource "google_service_account" "terraform" {
  account_id   = "terraform"
  display_name = "terraform"
  project      = "avathon-saas-runtime-setup"
}
# terraform import google_service_account.terraform projects/avathon-saas-runtime-setup/serviceAccounts/terraform@avathon-saas-runtime-setup.iam.gserviceaccount.com
