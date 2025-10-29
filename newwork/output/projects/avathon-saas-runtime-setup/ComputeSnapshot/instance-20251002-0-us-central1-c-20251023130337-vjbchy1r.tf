resource "google_compute_snapshot" "instance_20251002_0_us_central1_c_20251023130337_vjbchy1r" {
  labels = {
    managed-by-cnrm = "true"
  }

  name              = "instance-20251002-0-us-central1-c-20251023130337-vjbchy1r"
  project           = "avathon-saas-runtime-setup"
  source_disk       = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/zones/us-central1-c/disks/instance-20251002-042036"
  storage_locations = ["us"]
}
# terraform import google_compute_snapshot.instance_20251002_0_us_central1_c_20251023130337_vjbchy1r projects/avathon-saas-runtime-setup/global/snapshots/instance-20251002-0-us-central1-c-20251023130337-vjbchy1r
