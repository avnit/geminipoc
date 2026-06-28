resource "google_compute_firewall" "avathon_saas_runtime_setup_vpc_allow_https" {
  allow {
    ports    = ["443"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  name          = "avathon-saas-runtime-setup-vpc-allow-https"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  priority      = 1000
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https-server"]
}
# terraform import google_compute_firewall.avathon_saas_runtime_setup_vpc_allow_https projects/avathon-saas-runtime-setup/global/firewalls/avathon-saas-runtime-setup-vpc-allow-https
