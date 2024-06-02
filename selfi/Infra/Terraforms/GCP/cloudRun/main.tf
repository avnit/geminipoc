provider "google" {
  credentials = "${file(var.credentials)}"
  project     = "my-project-id"
  region      = "us-central1"
}

provider "google-beta" {
  credentials = "${file(var.credentials)}"
  project     = "my-project-id"
  region      = "us-central1"
}

resource "google_cloud_run_service" "default" {
  name     = "tftest-cloudrun"
  location = "us-central1"
  provider = "google-beta"

  metadata {
    namespace = "my-project-name"
  }

  spec {
    containers {
      image = "gcr.io/cloudrun/hello"
    }
  }
}


