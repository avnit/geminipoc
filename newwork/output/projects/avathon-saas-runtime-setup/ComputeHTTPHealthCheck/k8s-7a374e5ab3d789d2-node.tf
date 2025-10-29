resource "google_compute_http_health_check" "k8s_7a374e5ab3d789d2_node" {
  check_interval_sec  = 8
  description         = "{\"kubernetes.io/service-name\":\"k8s-7a374e5ab3d789d2-node\"}"
  healthy_threshold   = 1
  name                = "k8s-7a374e5ab3d789d2-node"
  port                = 10256
  project             = "avathon-saas-runtime-setup"
  request_path        = "/healthz"
  timeout_sec         = 1
  unhealthy_threshold = 3
}
# terraform import google_compute_http_health_check.k8s_7a374e5ab3d789d2_node projects/avathon-saas-runtime-setup/global/httpHealthChecks/k8s-7a374e5ab3d789d2-node
