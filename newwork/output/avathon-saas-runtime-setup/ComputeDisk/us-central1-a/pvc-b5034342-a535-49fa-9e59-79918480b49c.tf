resource "google_compute_disk" "pvc_b5034342_a535_49fa_9e59_79918480b49c" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-b5034342-a535-49fa-9e59-79918480b49c\",\"kubernetes.io/created-for/pvc/name\":\"cassandra-data-console-cong-chart-cassandra-0\",\"kubernetes.io/created-for/pvc/namespace\":\"default\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

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

  name                      = "pvc-b5034342-a535-49fa-9e59-79918480b49c"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 5
  type                      = "pd-balanced"
  zone                      = "us-central1-a"
}
# terraform import google_compute_disk.pvc_b5034342_a535_49fa_9e59_79918480b49c projects/avathon-saas-runtime-setup/zones/us-central1-a/disks/pvc-b5034342-a535-49fa-9e59-79918480b49c
