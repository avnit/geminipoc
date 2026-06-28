resource "google_compute_instance_group" "gke_primary_gke_clus_primary_node_poo_f37b357d_grp" {
  description = "This instance group is controlled by Instance Group Manager 'gke-primary-gke-clus-primary-node-poo-f37b357d-grp'. To modify instances in this group, use the Instance Group Manager API: https://cloud.google.com/compute/docs/reference/latest/instanceGroupManagers"
  instances   = ["https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/zones/us-central1-c/instances/gke-primary-gke-clus-primary-node-poo-f37b357d-093n", "https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/zones/us-central1-c/instances/gke-primary-gke-clus-primary-node-poo-f37b357d-0e5j", "https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/zones/us-central1-c/instances/gke-primary-gke-clus-primary-node-poo-f37b357d-x3fw"]
  name        = "gke-primary-gke-clus-primary-node-poo-f37b357d-grp"
  network     = "https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  project     = "avathon-saas-runtime-setup"
  zone        = "us-central1-c"
}
# terraform import google_compute_instance_group.gke_primary_gke_clus_primary_node_poo_f37b357d_grp projects/avathon-saas-runtime-setup/zones/us-central1-c/instanceGroups/gke-primary-gke-clus-primary-node-poo-f37b357d-grp
