resource "google_compute_disk" "pvc_c6c1edcc_9c84_414c_8970_961b8eebf6c0" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-c6c1edcc-9c84-414c-8970-961b8eebf6c0\",\"kubernetes.io/created-for/pvc/name\":\"cong-release-cong-chart-maana-share-pvc\",\"kubernetes.io/created-for/pvc/namespace\":\"console-app\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

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

  name                      = "pvc-c6c1edcc-9c84-414c-8970-961b8eebf6c0"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 5
  type                      = "pd-balanced"
  zone                      = "us-central1-f"
}
# terraform import google_compute_disk.pvc_c6c1edcc_9c84_414c_8970_961b8eebf6c0 projects/avathon-saas-runtime-setup/zones/us-central1-f/disks/pvc-c6c1edcc-9c84-414c-8970-961b8eebf6c0
