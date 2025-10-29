resource "google_compute_firewall" "test_p81_inbound" {
  allow {
    protocol = "all"
  }

  direction     = "INGRESS"
  name          = "test-p81-inbound"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  priority      = 1000
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["10.253.0.0/16"]
}
# terraform import google_compute_firewall.test_p81_inbound projects/avathon-saas-runtime-setup/global/firewalls/test-p81-inbound
