resource "google_compute_snapshot" "dataplatform_neon_us_central1_c_20250914130337_5kk9pyuj" {
  labels = {
    managed-by-cnrm = "true"
  }

  name              = "dataplatform-neon-us-central1-c-20250914130337-5kk9pyuj"
  project           = "avathon-saas-runtime-setup"
  source_disk       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/zones/us-central1-c/disks/dataplatform-neon"
  storage_locations = ["us"]
}
# terraform import google_compute_snapshot.dataplatform_neon_us_central1_c_20250914130337_5kk9pyuj projects/avathon-saas-runtime-setup/global/snapshots/dataplatform-neon-us-central1-c-20250914130337-5kk9pyuj
