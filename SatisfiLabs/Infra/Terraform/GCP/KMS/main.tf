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

resource "google_kms_key_ring" "satisfi-keyring" {
  name     = "keyring-mainkey"
  location = "global"
}