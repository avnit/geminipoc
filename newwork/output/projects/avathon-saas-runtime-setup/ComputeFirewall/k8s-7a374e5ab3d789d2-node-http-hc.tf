resource "google_compute_firewall" "k8s_7a374e5ab3d789d2_node_http_hc" {
  allow {
    ports    = ["10256"]
    protocol = "tcp"
  }

  description        = "{\"kubernetes.io/cluster-id\":\"7a374e5ab3d789d2\"}"
  destination_ranges = ["35.202.36.243"]
  direction          = "INGRESS"
  name               = "k8s-7a374e5ab3d789d2-node-http-hc"
  network            = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  priority           = 1000
  project            = "avathon-saas-runtime-setup"
  source_ranges      = ["130.211.0.0/22", "209.85.152.0/22", "209.85.204.0/22", "35.191.0.0/16"]
  target_tags        = ["gke-primary-gke-cluster-a7f64acd-node"]
}
# terraform import google_compute_firewall.k8s_7a374e5ab3d789d2_node_http_hc projects/avathon-saas-runtime-setup/global/firewalls/k8s-7a374e5ab3d789d2-node-http-hc
