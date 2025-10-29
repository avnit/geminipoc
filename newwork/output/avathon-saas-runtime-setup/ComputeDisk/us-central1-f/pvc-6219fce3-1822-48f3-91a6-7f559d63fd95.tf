resource "google_compute_disk" "pvc_6219fce3_1822_48f3_91a6_7f559d63fd95" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-6219fce3-1822-48f3-91a6-7f559d63fd95\",\"kubernetes.io/created-for/pvc/name\":\"cong-cong-chart-saq-data-pvc\",\"kubernetes.io/created-for/pvc/namespace\":\"default\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

  labels = {
    goog-gke-volume = ""
    managed-by-cnrm = "true"
  }

  name                      = "pvc-6219fce3-1822-48f3-91a6-7f559d63fd95"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 1
  type                      = "pd-balanced"
  zone                      = "us-central1-f"
}
# terraform import google_compute_disk.pvc_6219fce3_1822_48f3_91a6_7f559d63fd95 projects/avathon-saas-runtime-setup/zones/us-central1-f/disks/pvc-6219fce3-1822-48f3-91a6-7f559d63fd95
