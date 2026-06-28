resource "google_compute_vpn_gateway" "vpn_p81_spark_01" {
  name    = "vpn-p81-spark-01"
  network = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  project = "avathon-saas-runtime-setup"
  region  = "us-central1"
}
# terraform import google_compute_vpn_gateway.vpn_p81_spark_01 projects/avathon-saas-runtime-setup/regions/us-central1/targetVpnGateways/vpn-p81-spark-01
