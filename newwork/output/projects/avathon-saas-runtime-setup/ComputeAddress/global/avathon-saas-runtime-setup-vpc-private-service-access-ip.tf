resource "google_compute_global_address" "avathon_saas_runtime_setup_vpc_private_service_access_ip" {
  address      = "10.117.4.0"
  address_type = "INTERNAL"

  labels = {
    goog-terraform-provisioned = "true"
    managed-by-cnrm            = "true"
  }

  name          = "avathon-saas-runtime-setup-vpc-private-service-access-ip"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  prefix_length = 24
  project       = "avathon-saas-runtime-setup"
  purpose       = "VPC_PEERING"
}
# terraform import google_compute_global_address.avathon_saas_runtime_setup_vpc_private_service_access_ip projects/avathon-saas-runtime-setup/global/addresses/avathon-saas-runtime-setup-vpc-private-service-access-ip
