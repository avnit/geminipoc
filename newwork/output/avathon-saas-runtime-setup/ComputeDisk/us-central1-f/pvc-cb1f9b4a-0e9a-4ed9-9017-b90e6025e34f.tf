resource "google_compute_disk" "pvc_cb1f9b4a_0e9a_4ed9_9017_b90e6025e34f" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-cb1f9b4a-0e9a-4ed9-9017-b90e6025e34f\",\"kubernetes.io/created-for/pvc/name\":\"cassandra-data-cong-release-cong-chart-cassandra-0\",\"kubernetes.io/created-for/pvc/namespace\":\"console-app\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

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

  name                      = "pvc-cb1f9b4a-0e9a-4ed9-9017-b90e6025e34f"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 5
  type                      = "pd-balanced"
  zone                      = "us-central1-f"
}
# terraform import google_compute_disk.pvc_cb1f9b4a_0e9a_4ed9_9017_b90e6025e34f projects/avathon-saas-runtime-setup/zones/us-central1-f/disks/pvc-cb1f9b4a-0e9a-4ed9-9017-b90e6025e34f
