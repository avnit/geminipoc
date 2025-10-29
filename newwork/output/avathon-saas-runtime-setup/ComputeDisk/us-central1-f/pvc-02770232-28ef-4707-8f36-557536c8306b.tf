resource "google_compute_disk" "pvc_02770232_28ef_4707_8f36_557536c8306b" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-02770232-28ef-4707-8f36-557536c8306b\",\"kubernetes.io/created-for/pvc/name\":\"console-cong-chart-saq-data-pvc\",\"kubernetes.io/created-for/pvc/namespace\":\"console-app\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

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

  name                      = "pvc-02770232-28ef-4707-8f36-557536c8306b"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 10
  type                      = "pd-balanced"
  zone                      = "us-central1-f"
}
# terraform import google_compute_disk.pvc_02770232_28ef_4707_8f36_557536c8306b projects/avathon-saas-runtime-setup/zones/us-central1-f/disks/pvc-02770232-28ef-4707-8f36-557536c8306b
