terraform {
  backend "gcs" {
    bucket = "gvts-core"
    prefix = "terraform/state/gke"
  }
}

provider "google" {
  credentials = file(var.credentials[var.envt])
  project     = var.project_id[var.envt]
  region      = var.region
}

provider "google-beta" {
  credentials = file(var.credentials[var.envt])
  project     = var.project_id[var.envt]
  region      = var.region
}

data "google_client_config" "default" {
}

data "google_compute_subnetwork" "subnetwork" {
  name    = format ("%s-%s",var.project_id[var.envt],"subnetwork-app")
  project = var.project_id[var.envt]
  region  = var.region
}

resource "google_container_cluster" "primary" {
  provider = "google-beta"
  name                     = var.gke_cluster_name[var.envt]
  location                 = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1
  project = var.project_id[var.envt]
  network  = format("%s-%s", "custom-network", var.project_id[var.envt])
  subnetwork = format ("%s-%s",var.project_id[var.envt],"subnetwork-app")
  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
  ip_allocation_policy {
    cluster_ipv4_cidr_block = "10.59.0.0/20"
    services_ipv4_cidr_block = "10.57.0.0/20"
  }
  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "10.55.0.0/28"
  }
  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
    istio_config {
      disabled = false
    }
  }
  maintenance_policy {
    daily_maintenance_window {
        start_time = "09:00"
    }
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = format ("%s-%s",var.project_id[var.envt],"prod-node-pool")
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "false"
    }
   
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
   management {
      auto_repair  = true
      auto_upgrade = true
    }
    autoscaling {
       min_node_count = var.gke_minimal_worknode_count
       max_node_count = var.gke_maximum_worknode_count
    }
    timeouts {
      create = "90m"
      update = "50m"
    }
}
