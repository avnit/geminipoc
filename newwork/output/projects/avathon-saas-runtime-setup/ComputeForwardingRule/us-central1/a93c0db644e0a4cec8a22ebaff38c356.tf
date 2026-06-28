resource "google_compute_forwarding_rule" "a93c0db644e0a4cec8a22ebaff38c356" {
  description = "{\"kubernetes.io/service-name\":\"default/consul-consul-ui\"}"
  ip_address  = "34.68.138.230"
  ip_protocol = "TCP"

  labels = {
    managed-by-cnrm = "true"
  }

  load_balancing_scheme = "EXTERNAL"
  name                  = "a93c0db644e0a4cec8a22ebaff38c356"
  network_tier          = "PREMIUM"
  port_range            = "80-80"
  project               = "avathon-saas-runtime-setup"
  region                = "us-central1"
  target                = "https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/regions/us-central1/targetPools/a93c0db644e0a4cec8a22ebaff38c356"
}
# terraform import google_compute_forwarding_rule.a93c0db644e0a4cec8a22ebaff38c356 projects/avathon-saas-runtime-setup/regions/us-central1/forwardingRules/a93c0db644e0a4cec8a22ebaff38c356
