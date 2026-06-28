resource "google_compute_disk" "pvc_0021ac5b_a400_4688_bd2a_cf6011f71afb" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-0021ac5b-a400-4688-bd2a-cf6011f71afb\",\"kubernetes.io/created-for/pvc/name\":\"cong-cong-chart-mysql-data-pvc\",\"kubernetes.io/created-for/pvc/namespace\":\"default\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

  labels = {
    goog-gke-cluster-id-base32            = "u73evtkmjveu5e3nbd5lgel66rneey2titvuwrmuoejjqr3wuxha"
    goog-gke-cost-management              = ""
    goog-gke-node-pool-provisioning-model = "on-demand"
    goog-gke-volume                       = ""
    goog-k8s-cluster-location             = "us-central1"
    goog-k8s-cluster-name                 = "primary-gke-cluster"
    goog-k8s-node-pool-name               = "primary-node-pool"
    goog-terraform-provisioned            = "true"
    managed-by-cnrm                       = "true"
  }

  name                      = "pvc-0021ac5b-a400-4688-bd2a-cf6011f71afb"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 2
  type                      = "pd-balanced"
  zone                      = "us-central1-c"
}
# terraform import google_compute_disk.pvc_0021ac5b_a400_4688_bd2a_cf6011f71afb projects/avathon-saas-runtime-setup/zones/us-central1-c/disks/pvc-0021ac5b-a400-4688-bd2a-cf6011f71afb
