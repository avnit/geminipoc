resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-cluster"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = data.google_compute_network.main.name
  subnetwork = data.google_compute_subnetwork.main.name
  addons_config {
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }

    gcp_filestore_csi_driver_config {
      enabled = true
    }

    network_policy_config {
      disabled = true
    }
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "console-node"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  autoscaling {
    location_policy = "BALANCED"
    max_node_count  = 3
  }
  management {
    auto_repair  = true
    auto_upgrade = true
  }
  max_pods_per_node = 110
  node_config {
    disk_size_gb    = 100
    disk_type       = "pd-balanced"
    image_type      = "COS_CONTAINERD"
    logging_variant = "DEFAULT"
    machine_type = "e2-standard-8"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
    resource_labels = {
      goog-gke-node-pool-provisioning-model = "on-demand"
    }
    shielded_instance_config {
      enable_integrity_monitoring = true
    }
  }
}

provider "kubernetes" {
  host                   = "https://${google_container_cluster.primary.endpoint}"
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}

resource "kubernetes_namespace" "console_app" {
  metadata {
    name = "console-app"
  }
}
