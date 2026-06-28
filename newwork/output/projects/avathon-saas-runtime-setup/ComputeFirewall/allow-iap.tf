resource "google_compute_firewall" "allow_iap" {
  allow {
    ports    = ["22", "3389"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  name          = "allow-iap"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  priority      = 1000
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["35.235.240.0/20"]
}
# terraform import google_compute_firewall.allow_iap projects/avathon-saas-runtime-setup/global/firewalls/allow-iap
