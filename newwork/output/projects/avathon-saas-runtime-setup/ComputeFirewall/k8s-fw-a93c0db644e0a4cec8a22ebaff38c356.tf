resource "google_compute_firewall" "k8s_fw_a93c0db644e0a4cec8a22ebaff38c356" {
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }

  description        = "{\"kubernetes.io/service-name\":\"default/consul-consul-ui\", \"kubernetes.io/service-ip\":\"34.68.138.230\"}"
  destination_ranges = ["34.68.138.230"]
  direction          = "INGRESS"
  name               = "k8s-fw-a93c0db644e0a4cec8a22ebaff38c356"
  network            = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  priority           = 1000
  project            = "avathon-saas-runtime-setup"
  source_ranges      = ["0.0.0.0/0"]
  target_tags        = ["gke-primary-gke-cluster-a7f64acd-node"]
}
# terraform import google_compute_firewall.k8s_fw_a93c0db644e0a4cec8a22ebaff38c356 projects/avathon-saas-runtime-setup/global/firewalls/k8s-fw-a93c0db644e0a4cec8a22ebaff38c356
