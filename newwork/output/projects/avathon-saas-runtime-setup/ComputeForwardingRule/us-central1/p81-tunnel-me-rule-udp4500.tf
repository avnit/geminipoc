resource "google_compute_forwarding_rule" "p81_tunnel_me_rule_udp4500" {
  ip_address  = "34.133.24.167"
  ip_protocol = "UDP"

  labels = {
    managed-by-cnrm = "true"
  }

  load_balancing_scheme = "EXTERNAL"
  name                  = "p81-tunnel-me-rule-udp4500"
  network_tier          = "PREMIUM"
  port_range            = "500-500"
  project               = "avathon-saas-runtime-setup"
  region                = "us-central1"
  target                = "https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/regions/us-central1/targetVpnGateways/vpn-p81-spark-01"
}
# terraform import google_compute_forwarding_rule.p81_tunnel_me_rule_udp4500 projects/avathon-saas-runtime-setup/regions/us-central1/forwardingRules/p81-tunnel-me-rule-udp4500
