
resource "google_filestore_instance" "main" {
  name     = "my-filestore"
  location = var.zone
  tier     = "STANDARD"

  file_shares {
    capacity_gb = 1024
    name        = "share1"
  }

  networks {
    network = "main-vpc"
    modes   = ["MODE_IPV4"]
  }
}
