data "google_compute_network" "main" {
  name = "main-vpc"
}

data "google_compute_subnetwork" "main" {
  name   = "main-subnet"
  region = var.region
}