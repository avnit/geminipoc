resource "google_compute_network" "avathon_saas_runtime_setup_vpc" {
  auto_create_subnetworks                   = false
  name                                      = "avathon-saas-runtime-setup-vpc"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  project                                   = "avathon-saas-runtime-setup"
  routing_mode                              = "REGIONAL"
}
# terraform import google_compute_network.avathon_saas_runtime_setup_vpc projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc
