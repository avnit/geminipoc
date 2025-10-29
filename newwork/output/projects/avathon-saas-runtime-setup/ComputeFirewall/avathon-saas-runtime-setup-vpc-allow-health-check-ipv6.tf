resource "google_compute_firewall" "avathon_saas_runtime_setup_vpc_allow_health_check_ipv6" {
  allow {
    protocol = "tcp"
  }

  direction     = "INGRESS"
  name          = "avathon-saas-runtime-setup-vpc-allow-health-check-ipv6"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  priority      = 1000
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["2600:1901:8001::/48", "2600:2d00:1:b029::/64"]
  target_tags   = ["lb-health-check"]
}
# terraform import google_compute_firewall.avathon_saas_runtime_setup_vpc_allow_health_check_ipv6 projects/avathon-saas-runtime-setup/global/firewalls/avathon-saas-runtime-setup-vpc-allow-health-check-ipv6
