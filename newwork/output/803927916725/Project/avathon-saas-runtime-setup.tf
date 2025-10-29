resource "google_project" "avathon_saas_runtime_setup" {
  auto_create_network = true

  labels = {
    goog-terraform-provisioned = "true"
    managed-by-cnrm            = "true"
  }

  name       = "avathon-saas-runtime-setup"
  org_id     = "803927916725"
  project_id = "avathon-saas-runtime-setup"
}
# terraform import google_project.avathon_saas_runtime_setup projects/avathon-saas-runtime-setup
