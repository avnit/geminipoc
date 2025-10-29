resource "google_compute_subnetwork" "avathon_saas_runtime_setup_cloudrun" {
  ip_cidr_range              = "10.117.2.0/24"
  name                       = "avathon-saas-runtime-setup-cloudrun"
  network                    = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = "avathon-saas-runtime-setup"
  purpose                    = "PRIVATE"
  region                     = "us-central1"
  stack_type                 = "IPV4_ONLY"
}
# terraform import google_compute_subnetwork.avathon_saas_runtime_setup_cloudrun projects/avathon-saas-runtime-setup/regions/us-central1/subnetworks/avathon-saas-runtime-setup-cloudrun
