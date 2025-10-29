resource "google_compute_instance" "instance_20251002_042036" {
  boot_disk {
    auto_delete = true
    device_name = "instance-20251002-042036"

    initialize_params {
      image = "https://www.googleapis.com/compute/beta/projects/debian-cloud/global/images/debian-12-bookworm-v20250910"
      size  = 10
      type  = "pd-balanced"
    }

    mode   = "READ_WRITE"
    source = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/zones/us-central1-c/disks/instance-20251002-042036"
  }

  confidential_instance_config {
    enable_confidential_compute = false
  }

  labels = {
    goog-ops-agent-policy = "v2-x86-template-1-4-0"
    managed-by-cnrm       = "true"
  }

  machine_type = "e2-medium"

  metadata = {
    enable-osconfig = "TRUE"
  }

  name = "instance-20251002-042036"

  network_interface {
    access_config {
      nat_ip       = "136.114.6.3"
      network_tier = "PREMIUM"
    }

    network            = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/global/networks/avathon-saas-runtime-setup-vpc"
    network_ip         = "10.117.2.4"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/avathon-saas-runtime-setup/regions/us-central1/subnetworks/avathon-saas-runtime-setup-cloudrun"
    subnetwork_project = "avathon-saas-runtime-setup"
  }

  project = "avathon-saas-runtime-setup"

  reservation_affinity {
    type = "ANY_RESERVATION"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "341534251420-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
  }

  zone = "us-central1-c"
}
# terraform import google_compute_instance.instance_20251002_042036 projects/avathon-saas-runtime-setup/zones/us-central1-c/instances/instance-20251002-042036
