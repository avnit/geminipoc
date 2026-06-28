resource "google_compute_firewall" "gke_primary_gke_cluster_a7f64acd_all" {
  allow {
    protocol = "ah"
  }

  allow {
    protocol = "esp"
  }

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "sctp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  direction     = "INGRESS"
  name          = "gke-primary-gke-cluster-a7f64acd-all"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  priority      = 1000
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["10.144.0.0/14"]
  target_tags   = ["gke-primary-gke-cluster-a7f64acd-node"]
}
# terraform import google_compute_firewall.gke_primary_gke_cluster_a7f64acd_all projects/avathon-saas-runtime-setup/global/firewalls/gke-primary-gke-cluster-a7f64acd-all
