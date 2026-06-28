resource "google_compute_firewall" "avathon_saas_runtime_setup_vpc_external_lb_to_backend" {
  allow {
    ports    = ["8080", "8000", "9200", "9000", "8443"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  name          = "avathon-saas-runtime-setup-vpc-external-lb-to-backend"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  priority      = 1000
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
}
# terraform import google_compute_firewall.avathon_saas_runtime_setup_vpc_external_lb_to_backend projects/avathon-saas-runtime-setup/global/firewalls/avathon-saas-runtime-setup-vpc-external-lb-to-backend
