resource "google_compute_firewall" "avathon_saas_runtime_setup_vpc_allow_health_check" {
  allow {
    protocol = "tcp"
  }

  direction     = "INGRESS"
  name          = "avathon-saas-runtime-setup-vpc-allow-health-check"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  priority      = 1000
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["130.211.0.0/22", "209.85.152.0/22", "209.85.204.0/22", "35.191.0.0/16"]
  target_tags   = ["lb-health-check"]
}
# terraform import google_compute_firewall.avathon_saas_runtime_setup_vpc_allow_health_check projects/avathon-saas-runtime-setup/global/firewalls/avathon-saas-runtime-setup-vpc-allow-health-check
