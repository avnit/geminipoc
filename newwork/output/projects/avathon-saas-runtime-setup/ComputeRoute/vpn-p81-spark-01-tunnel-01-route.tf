resource "google_compute_route" "vpn_p81_spark_01_tunnel_01_route" {
  dest_range          = "10.253.0.0/16"
  name                = "vpn-p81-spark-01-tunnel-01-route"
  network             = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  next_hop_vpn_tunnel = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/regions/us-central1/vpnTunnels/vpn-p81-spark-01-tunnel-01"
  priority            = 1000
  project             = "avathon-saas-runtime-setup"
}
# terraform import google_compute_route.vpn_p81_spark_01_tunnel_01_route projects/avathon-saas-runtime-setup/global/routes/vpn-p81-spark-01-tunnel-01-route
