resource "google_compute_disk" "pvc_1a5ff5d1_ce3d_4d2f_aeaa_9ee18acdaffa" {
  description = "{\"kubernetes.io/created-for/pv/name\":\"pvc-1a5ff5d1-ce3d-4d2f-aeaa-9ee18acdaffa\",\"kubernetes.io/created-for/pvc/name\":\"cassandra-data-console-cong-chart-cassandra-0\",\"kubernetes.io/created-for/pvc/namespace\":\"console-app\",\"storage.gke.io/created-by\":\"pd.csi.storage.gke.io\"}"

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

  name                      = "pvc-1a5ff5d1-ce3d-4d2f-aeaa-9ee18acdaffa"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 5
  type                      = "pd-balanced"
  zone                      = "us-central1-f"
}
# terraform import google_compute_disk.pvc_1a5ff5d1_ce3d_4d2f_aeaa_9ee18acdaffa projects/avathon-saas-runtime-setup/zones/us-central1-f/disks/pvc-1a5ff5d1-ce3d-4d2f-aeaa-9ee18acdaffa
