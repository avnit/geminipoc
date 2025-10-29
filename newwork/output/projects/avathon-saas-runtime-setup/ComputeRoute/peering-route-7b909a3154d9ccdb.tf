resource "google_compute_route" "peering_route_7b909a3154d9ccdb" {
  description = "Auto generated route via peering [servicenetworking-googleapis-com]."
  dest_range  = "10.66.192.0/26"
  name        = "peering-route-7b909a3154d9ccdb"
  network     = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  priority    = 0
  project     = "avathon-saas-runtime-setup"
}
# terraform import google_compute_route.peering_route_7b909a3154d9ccdb projects/avathon-saas-runtime-setup/global/routes/peering-route-7b909a3154d9ccdb
