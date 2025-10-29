resource "google_compute_disk" "pvc_fa1b3f13_01c7_47e6_b14a_34e0437bced0" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-fa1b3f13-01c7-47e6-b14a-34e0437bced0\",\"kubernetes.io/created-for/pvc/name\":\"cassandra-data-cong-cong-chart-cassandra-0\",\"kubernetes.io/created-for/pvc/namespace\":\"default\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

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

  name                      = "pvc-fa1b3f13-01c7-47e6-b14a-34e0437bced0"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 5
  type                      = "pd-balanced"
  zone                      = "us-central1-a"
}
# terraform import google_compute_disk.pvc_fa1b3f13_01c7_47e6_b14a_34e0437bced0 projects/avathon-saas-runtime-setup/zones/us-central1-a/disks/pvc-fa1b3f13-01c7-47e6-b14a-34e0437bced0
