resource "google_compute_network" "main_vpc" {
  auto_create_subnetworks                   = false
  name                                      = "main-vpc"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  project                                   = "avathon-saas-runtime-setup"
  routing_mode                              = "REGIONAL"
}
# terraform import google_compute_network.main_vpc projects/avathon-saas-runtime-setup/global/networks/main-vpc
