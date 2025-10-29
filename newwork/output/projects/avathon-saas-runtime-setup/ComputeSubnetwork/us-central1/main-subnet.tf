resource "google_compute_subnetwork" "main_subnet" {
  ip_cidr_range              = "10.0.0.0/24"
  name                       = "main-subnet"
  network                    = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = "avathon-saas-runtime-setup"
  purpose                    = "PRIVATE"
  region                     = "us-central1"

  secondary_ip_range {
    ip_cidr_range = "10.144.0.0/14"
    range_name    = "gke-primary-gke-cluster-pods-a7f64acd"
  }

  stack_type = "IPV4_ONLY"
}
# terraform import google_compute_subnetwork.main_subnet projects/avathon-saas-runtime-setup/regions/us-central1/subnetworks/main-subnet
