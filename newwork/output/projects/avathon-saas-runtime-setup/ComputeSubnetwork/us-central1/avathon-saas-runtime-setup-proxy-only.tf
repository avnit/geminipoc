resource "google_compute_subnetwork" "avathon_saas_runtime_setup_proxy_only" {
  ip_cidr_range              = "10.117.3.0/24"
  name                       = "avathon-saas-runtime-setup-proxy-only"
  network                    = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = "avathon-saas-runtime-setup"
  purpose                    = "REGIONAL_MANAGED_PROXY"
  region                     = "us-central1"
  role                       = "ACTIVE"
  stack_type                 = "IPV4_ONLY"
}
# terraform import google_compute_subnetwork.avathon_saas_runtime_setup_proxy_only projects/avathon-saas-runtime-setup/regions/us-central1/subnetworks/avathon-saas-runtime-setup-proxy-only
