resource "google_container_node_pool" "primary_node_pool" {
  autoscaling {
    location_policy = "BALANCED"
    max_node_count  = 3
  }

  cluster            = "primary-gke-cluster"
  initial_node_count = 3
  location           = "us-central1"

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  max_pods_per_node = 110
  name              = "primary-node-pool"

  network_config {
    pod_ipv4_cidr_block = "10.144.0.0/14"
    pod_range           = "gke-primary-gke-cluster-pods-a7f64acd"
  }

  node_config {
    disk_size_gb    = 100
    disk_type       = "pd-balanced"
    image_type      = "COS_CONTAINERD"
    logging_variant = "DEFAULT"
    machine_type    = "e2-medium"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]

    resource_labels = {
      goog-gke-node-pool-provisioning-model = "on-demand"
    }

    service_account = "default"

    shielded_instance_config {
      enable_integrity_monitoring = true
    }
  }

  node_count     = 3
  node_locations = ["us-central1-a", "us-central1-c", "us-central1-f"]
  project        = "avathon-saas-runtime-setup"

  upgrade_settings {
    max_surge = 1
    strategy  = "SURGE"
  }

  version = "1.33.5-gke.1080000"
}
# terraform import google_container_node_pool.primary_node_pool avathon-saas-runtime-setup/us-central1/primary-gke-cluster/primary-node-pool
