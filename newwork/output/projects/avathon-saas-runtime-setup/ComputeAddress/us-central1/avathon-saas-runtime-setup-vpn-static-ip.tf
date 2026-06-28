resource "google_compute_address" "avathon_saas_runtime_setup_vpn_static_ip" {
  address      = "34.133.24.167"
  address_type = "EXTERNAL"

  labels = {
    goog-terraform-provisioned = "true"
    managed-by-cnrm            = "true"
  }

  name         = "avathon-saas-runtime-setup-vpn-static-ip"
  network_tier = "PREMIUM"
  project      = "avathon-saas-runtime-setup"
  region       = "us-central1"
}
# terraform import google_compute_address.avathon_saas_runtime_setup_vpn_static_ip projects/avathon-saas-runtime-setup/regions/us-central1/addresses/avathon-saas-runtime-setup-vpn-static-ip
