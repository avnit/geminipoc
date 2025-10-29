resource "google_compute_firewall" "avathon_saas_runtime_setup_vpc_allow_internal_subnet" {
  allow {
    protocol = "tcp"
  }

  direction     = "INGRESS"
  name          = "avathon-saas-runtime-setup-vpc-allow-internal-subnet"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  priority      = 1000
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["10.117.0.0/23", "10.117.2.0/24"]
}
# terraform import google_compute_firewall.avathon_saas_runtime_setup_vpc_allow_internal_subnet projects/avathon-saas-runtime-setup/global/firewalls/avathon-saas-runtime-setup-vpc-allow-internal-subnet
