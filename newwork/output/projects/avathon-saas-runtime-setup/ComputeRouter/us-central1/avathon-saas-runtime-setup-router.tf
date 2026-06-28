resource "google_compute_router" "avathon_saas_runtime_setup_router" {
  name    = "avathon-saas-runtime-setup-router"
  network = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
  project = "avathon-saas-runtime-setup"
  region  = "us-central1"
}
# terraform import google_compute_router.avathon_saas_runtime_setup_router projects/avathon-saas-runtime-setup/regions/us-central1/routers/avathon-saas-runtime-setup-router
