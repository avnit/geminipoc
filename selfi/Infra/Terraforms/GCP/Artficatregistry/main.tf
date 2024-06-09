terraform {
 backend "gcs" {
   bucket  = "satisfi-core"
   prefix  = "terraform/state/artifact"
 }
}

provider "google" {
  credentials = file(var.credentials[var.envt])
  project     = var.project_id[var.envt]
  region      = var.region
}

# Create an Artifactory repository
resource "google_artifact_registry_repository" "artifactory_repository" {
  project       = var.project_id[var.envt]
  location      = var.region
  repository_id = "cloud-run-artifact-regsitry"
  format        = "DOCKER"
  description   = "cloud-run repository repository "
}


# Grant permissions for Cloud Function to push images
resource "google_artifact_registry_repository_iam_binding" "cloud_function_iam_binding" {
  repository = google_artifact_registry_repository.artifactory_repository.name
  location   = var.region
  role       = "roles/artifactregistry.writer"
  project    = var.[var.envt]

  members = [
    "serviceAccount:${google_cloudfunctions_function.Cloud_function.service_account_email}"
  ]
}