resource "google_compute_disk" "pvc_71240a74_9ad5_4cd6_bbd5_dcfbdc7e9058" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-71240a74-9ad5-4cd6-bbd5-dcfbdc7e9058\",\"kubernetes.io/created-for/pvc/name\":\"cassandra-data-my-apps-cong-chart-cassandra-0\",\"kubernetes.io/created-for/pvc/namespace\":\"default\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

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

  name                      = "pvc-71240a74-9ad5-4cd6-bbd5-dcfbdc7e9058"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 5
  type                      = "pd-balanced"
  zone                      = "us-central1-a"
}
# terraform import google_compute_disk.pvc_71240a74_9ad5_4cd6_bbd5_dcfbdc7e9058 projects/avathon-saas-runtime-setup/zones/us-central1-a/disks/pvc-71240a74-9ad5-4cd6-bbd5-dcfbdc7e9058
