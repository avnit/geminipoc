resource "google_compute_firewall" "avathon_saas_runtime_setup_vpc_allow_http" {
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  name          = "avathon-saas-runtime-setup-vpc-allow-http"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  priority      = 1000
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
# terraform import google_compute_firewall.avathon_saas_runtime_setup_vpc_allow_http projects/avathon-saas-runtime-setup/global/firewalls/avathon-saas-runtime-setup-vpc-allow-http
