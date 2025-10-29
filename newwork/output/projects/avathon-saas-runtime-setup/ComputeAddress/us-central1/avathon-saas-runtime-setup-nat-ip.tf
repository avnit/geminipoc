resource "google_compute_address" "avathon_saas_runtime_setup_nat_ip" {
  address      = "34.72.149.249"
  address_type = "EXTERNAL"

  labels = {
    goog-terraform-provisioned = "true"
    managed-by-cnrm            = "true"
  }

  name         = "avathon-saas-runtime-setup-nat-ip"
  network_tier = "PREMIUM"
  project      = "avathon-saas-runtime-setup"
  region       = "us-central1"
}
# terraform import google_compute_address.avathon_saas_runtime_setup_nat_ip projects/avathon-saas-runtime-setup/regions/us-central1/addresses/avathon-saas-runtime-setup-nat-ip
