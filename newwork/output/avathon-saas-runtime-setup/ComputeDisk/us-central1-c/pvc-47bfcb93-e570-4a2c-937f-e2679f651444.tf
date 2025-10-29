resource "google_compute_disk" "pvc_47bfcb93_e570_4a2c_937f_e2679f651444" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-47bfcb93-e570-4a2c-937f-e2679f651444\",\"kubernetes.io/created-for/pvc/name\":\"cong-cong-chart-consul-data-pvc\",\"kubernetes.io/created-for/pvc/namespace\":\"default\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

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

  name                      = "pvc-47bfcb93-e570-4a2c-937f-e2679f651444"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 1
  type                      = "pd-balanced"
  zone                      = "us-central1-c"
}
# terraform import google_compute_disk.pvc_47bfcb93_e570_4a2c_937f_e2679f651444 projects/avathon-saas-runtime-setup/zones/us-central1-c/disks/pvc-47bfcb93-e570-4a2c-937f-e2679f651444
