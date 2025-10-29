resource "google_compute_firewall" "gke_primary_gke_cluster_a7f64acd_vms" {
  allow {
    ports    = ["1-65535"]
    protocol = "tcp"
  }

  allow {
    ports    = ["1-65535"]
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  direction     = "INGRESS"
  name          = "gke-primary-gke-cluster-a7f64acd-vms"
  network       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  priority      = 1000
  project       = "avathon-saas-runtime-setup"
  source_ranges = ["10.0.0.0/24"]
  target_tags   = ["gke-primary-gke-cluster-a7f64acd-node"]
}
# terraform import google_compute_firewall.gke_primary_gke_cluster_a7f64acd_vms projects/avathon-saas-runtime-setup/global/firewalls/gke-primary-gke-cluster-a7f64acd-vms
