resource "google_compute_vpn_tunnel" "vpn_p81_spark_01_tunnel_01" {
  ike_version = 2

  labels = {
    goog-terraform-provisioned = "true"
    managed-by-cnrm            = "true"
  }

  local_traffic_selector  = ["0.0.0.0/0"]
  name                    = "vpn-p81-spark-01-tunnel-01"
  peer_ip                 = "64.226.140.115"
  project                 = "avathon-saas-runtime-setup"
  region                  = "us-central1"
  remote_traffic_selector = ["0.0.0.0/0"]
  target_vpn_gateway      = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/regions/us-central1/targetVpnGateways/vpn-p81-spark-01"
}
# terraform import google_compute_vpn_tunnel.vpn_p81_spark_01_tunnel_01 projects/avathon-saas-runtime-setup/regions/us-central1/vpnTunnels/vpn-p81-spark-01-tunnel-01
