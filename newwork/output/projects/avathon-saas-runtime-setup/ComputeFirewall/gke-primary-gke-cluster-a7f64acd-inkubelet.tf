resource "google_compute_firewall" "gke_primary_gke_cluster_a7f64acd_inkubelet" {
  allow {
    ports    = ["10255"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  name          = "gke-primary-gke-cluster-a7f64acd-inkubelet"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  priority      = 999
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["10.144.0.0/14"]
  source_tags   = ["gke-primary-gke-cluster-a7f64acd-node"]
  target_tags   = ["gke-primary-gke-cluster-a7f64acd-node"]
}
# terraform import google_compute_firewall.gke_primary_gke_cluster_a7f64acd_inkubelet projects/avathon-saas-runtime-setup/global/firewalls/gke-primary-gke-cluster-a7f64acd-inkubelet
