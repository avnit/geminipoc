resource "google_compute_snapshot" "dataplatform_neon_us_central1_c_20250907130337_onal5qt7" {
  labels = {
    managed-by-cnrm = "true"
  }

  name              = "dataplatform-neon-us-central1-c-20250907130337-onal5qt7"
  project           = "avathon-saas-runtime-setup"
  source_disk       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/zones/us-central1-c/disks/dataplatform-neon"
  storage_locations = ["us"]
}
# terraform import google_compute_snapshot.dataplatform_neon_us_central1_c_20250907130337_onal5qt7 projects/avathon-saas-runtime-setup/global/snapshots/dataplatform-neon-us-central1-c-20250907130337-onal5qt7
