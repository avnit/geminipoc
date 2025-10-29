resource "google_compute_target_pool" "a93c0db644e0a4cec8a22ebaff38c356" {
  description      = "{\"kubernetes.io/service-name\":\"default/consul-consul-ui\"}"
  health_checks    = ["https://www.googleapis.com/compute/beta/projects/avathon-saas-runtime-setup/global/httpHealthChecks/k8s-7a374e5ab3d789d2-node"]
  instances        = ["us-central1-a/gke-primary-gke-clus-primary-node-poo-dc619f79-3iav", "us-central1-a/gke-primary-gke-clus-primary-node-poo-dc619f79-fdbf", "us-central1-a/gke-primary-gke-clus-primary-node-poo-dc619f79-vdze", "us-central1-c/gke-primary-gke-clus-primary-node-poo-f37b357d-093n", "us-central1-c/gke-primary-gke-clus-primary-node-poo-f37b357d-0e5j", "us-central1-c/gke-primary-gke-clus-primary-node-poo-f37b357d-x3fw", "us-central1-f/gke-primary-gke-clus-primary-node-poo-be30a3d2-le2e", "us-central1-f/gke-primary-gke-clus-primary-node-poo-be30a3d2-m6s6", "us-central1-f/gke-primary-gke-clus-primary-node-poo-be30a3d2-wztb"]
  name             = "a93c0db644e0a4cec8a22ebaff38c356"
  project          = "avathon-saas-runtime-setup"
  region           = "us-central1"
  session_affinity = "NONE"
}
# terraform import google_compute_target_pool.a93c0db644e0a4cec8a22ebaff38c356 projects/avathon-saas-runtime-setup/regions/us-central1/targetPools/a93c0db644e0a4cec8a22ebaff38c356
