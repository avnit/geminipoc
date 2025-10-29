resource "google_compute_instance_group" "gke_primary_gke_clus_primary_node_poo_dc619f79_grp" {
  description = "This instance group is controlled by Instance Group Manager 'gke-primary-gke-clus-primary-node-poo-dc619f79-grp'. To modify instances in this group, use the Instance Group Manager API: https://cloud.google.com/compute/docs/reference/latest/instanceGroupManagers"
  instances   = ["https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/zones/us-central1-a/instances/gke-primary-gke-clus-primary-node-poo-dc619f79-3iav", "https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/zones/us-central1-a/instances/gke-primary-gke-clus-primary-node-poo-dc619f79-fdbf", "https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/zones/us-central1-a/instances/gke-primary-gke-clus-primary-node-poo-dc619f79-vdze"]
  name        = "gke-primary-gke-clus-primary-node-poo-dc619f79-grp"
  network     = "https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/global/networks/main-vpc"
  project     = "avathon-saas-runtime-setup"
  zone        = "us-central1-a"
}
# terraform import google_compute_instance_group.gke_primary_gke_clus_primary_node_poo_dc619f79_grp projects/avathon-saas-runtime-setup/zones/us-central1-a/instanceGroups/gke-primary-gke-clus-primary-node-poo-dc619f79-grp
