resource "google_compute_disk" "pvc_7d8c7586_e6d8_416c_8154_7d610c4a3755" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-7d8c7586-e6d8-416c-8154-7d610c4a3755\",\"kubernetes.io/created-for/pvc/name\":\"console-cong-chart-consul-data-pvc\",\"kubernetes.io/created-for/pvc/namespace\":\"console-app\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

  labels = {
    goog-gke-volume = ""
    managed-by-cnrm = "true"
  }

  name                      = "pvc-7d8c7586-e6d8-416c-8154-7d610c4a3755"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 1
  type                      = "pd-balanced"
  zone                      = "us-central1-f"
}
# terraform import google_compute_disk.pvc_7d8c7586_e6d8_416c_8154_7d610c4a3755 projects/avathon-saas-runtime-setup/zones/us-central1-f/disks/pvc-7d8c7586-e6d8-416c-8154-7d610c4a3755
