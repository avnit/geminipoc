resource "google_compute_disk" "pvc_511155b3_0e7e_4226_8280_bc6420838fd3" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-511155b3-0e7e-4226-8280-bc6420838fd3\",\"kubernetes.io/created-for/pvc/name\":\"cong-release-cong-chart-modules-pvc\",\"kubernetes.io/created-for/pvc/namespace\":\"console-app\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

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

  name                      = "pvc-511155b3-0e7e-4226-8280-bc6420838fd3"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 1
  type                      = "pd-balanced"
  zone                      = "us-central1-f"
}
# terraform import google_compute_disk.pvc_511155b3_0e7e_4226_8280_bc6420838fd3 projects/avathon-saas-runtime-setup/zones/us-central1-f/disks/pvc-511155b3-0e7e-4226-8280-bc6420838fd3
