resource "google_compute_instance_group" "gke_primary_gke_clus_primary_node_poo_be30a3d2_grp" {
  description = "This instance group is controlled by Instance Group Manager 'gke-primary-gke-clus-primary-node-poo-be30a3d2-grp'. To modify instances in this group, use the Instance Group Manager API: https://cloud.google.com/compute/docs/reference/latest/instanceGroupManagers"
  instances   = ["https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/zones/us-central1-f/instances/gke-primary-gke-clus-primary-node-poo-be30a3d2-le2e", "https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/zones/us-central1-f/instances/gke-primary-gke-clus-primary-node-poo-be30a3d2-m6s6", "https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/zones/us-central1-f/instances/gke-primary-gke-clus-primary-node-poo-be30a3d2-wztb"]
  name        = "gke-primary-gke-clus-primary-node-poo-be30a3d2-grp"
  network     = "https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  project     = "avathon-saas-runtime-setup"
  zone        = "us-central1-f"
}
# terraform import google_compute_instance_group.gke_primary_gke_clus_primary_node_poo_be30a3d2_grp projects/avathon-saas-runtime-setup/zones/us-central1-f/instanceGroups/gke-primary-gke-clus-primary-node-poo-be30a3d2-grp
