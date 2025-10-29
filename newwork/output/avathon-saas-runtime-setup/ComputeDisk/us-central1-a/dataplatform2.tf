resource "google_compute_disk" "dataplatform2" {
  guest_os_features {
    type = "GVNIC"
  }

  guest_os_features {
    type = "SEV_CAPABLE"
  }

  guest_os_features {
    type = "SEV_LIVE_MIGRATABLE_V2"
  }

  guest_os_features {
    type = "UEFI_COMPATIBLE"
  }

  guest_os_features {
    type = "VIRTIO_SCSI_MULTIQUEUE"
  }

  image = "https://www.googleapis.com/compute/beta/projects/debian-cloud/global/images/debian-12-bookworm-v20250812"

  labels = {
    managed-by-cnrm = "true"
  }

  licenses                  = ["https://www.googleapis.com/compute/v1/projects/debian-cloud/global/licenses/debian-12-bookworm"]
  name                      = "dataplatform2"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  size                      = 100
  type                      = "pd-balanced"
  zone                      = "us-central1-a"
}
# terraform import google_compute_disk.dataplatform2 projects/avathon-saas-runtime-setup/zones/us-central1-a/disks/dataplatform2
