resource "google_compute_disk" "pvc_3e062223_21e3_477f_b46f_ce072842f5df" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-3e062223-21e3-477f-b46f-ce072842f5df\",\"kubernetes.io/created-for/pvc/name\":\"data-default-consul-consul-server-0\",\"kubernetes.io/created-for/pvc/namespace\":\"default\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

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

  name                      = "pvc-3e062223-21e3-477f-b46f-ce072842f5df"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 10
  type                      = "pd-balanced"
  zone                      = "us-central1-c"
}
# terraform import google_compute_disk.pvc_3e062223_21e3_477f_b46f_ce072842f5df projects/avathon-saas-runtime-setup/zones/us-central1-c/disks/pvc-3e062223-21e3-477f-b46f-ce072842f5df
