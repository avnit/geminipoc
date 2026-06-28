resource "google_compute_disk" "instance_20251002_042036" {
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

  image = "https://www.googleapis.com/compute/beta/projects/debian-cloud/global/images/debian-12-bookworm-v20250910"

  labels = {
    managed-by-cnrm = "true"
  }

  licenses                  = ["https://www.googleapis.com/compute/v1/projects/debian-cloud/global/licenses/debian-12-bookworm"]
  name                      = "instance-20251002-042036"
  physical_block_size_bytes = 4096
  project                   = "avathon-saas-runtime-setup"
  resource_policies         = ["https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/regions/us-central1/resourcePolicies/default-schedule-1"]
  size                      = 10
  type                      = "pd-balanced"
  zone                      = "us-central1-c"
}
# terraform import google_compute_disk.instance_20251002_042036 projects/avathon-saas-runtime-setup/zones/us-central1-c/disks/instance-20251002-042036
