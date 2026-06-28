resource "google_compute_disk" "pvc_4ddaa768_bbfd_48f2_8ac4_7f40c05637a8" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-4ddaa768-bbfd-48f2-8ac4-7f40c05637a8\",\"kubernetes.io/created-for/pvc/name\":\"cong-release-cong-chart-saq-data-pvc\",\"kubernetes.io/created-for/pvc/namespace\":\"console-app\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

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

  name                      = "pvc-4ddaa768-bbfd-48f2-8ac4-7f40c05637a8"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 1
  type                      = "pd-balanced"
  zone                      = "us-central1-f"
}
# terraform import google_compute_disk.pvc_4ddaa768_bbfd_48f2_8ac4_7f40c05637a8 projects/avathon-saas-runtime-setup/zones/us-central1-f/disks/pvc-4ddaa768-bbfd-48f2-8ac4-7f40c05637a8
