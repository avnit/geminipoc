resource "google_compute_global_address" "main_vpc_ip_range" {
  address      = "10.66.192.0"
  address_type = "INTERNAL"

  labels = {
    managed-by-cnrm = "true"
  }

  name          = "main-vpc-ip-range"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  prefix_length = 20
  project       = "avathon-saas-runtime-setup"
  purpose       = "VPC_PEERING"
}
# terraform import google_compute_global_address.main_vpc_ip_range projects/avathon-saas-runtime-setup/global/addresses/main-vpc-ip-range
