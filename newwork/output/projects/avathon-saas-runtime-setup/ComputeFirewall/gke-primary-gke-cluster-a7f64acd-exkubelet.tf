resource "google_compute_firewall" "gke_primary_gke_cluster_a7f64acd_exkubelet" {
  deny {
    ports    = ["10255"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  name          = "gke-primary-gke-cluster-a7f64acd-exkubelet"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  priority      = 1000
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["gke-primary-gke-cluster-a7f64acd-node"]
}
# terraform import google_compute_firewall.gke_primary_gke_cluster_a7f64acd_exkubelet projects/avathon-saas-runtime-setup/global/firewalls/gke-primary-gke-cluster-a7f64acd-exkubelet
