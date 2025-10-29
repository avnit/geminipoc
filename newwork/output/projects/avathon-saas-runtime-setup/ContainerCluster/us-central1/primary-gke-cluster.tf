resource "google_container_cluster" "primary_gke_cluster" {
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

  cluster_autoscaling {
    autoscaling_profile = "BALANCED"
  }

  cluster_ipv4_cidr = "10.144.0.0/14"

  cluster_telemetry {
    type = "ENABLED"
  }

  database_encryption {
    state = "DECRYPTED"
  }

  default_max_pods_per_node = 110

  default_snat_status {
    disabled = false
  }

  enable_shielded_nodes = true
  initial_node_count    = 1

  ip_allocation_policy {
    cluster_ipv4_cidr_block      = "10.144.0.0/14"
    cluster_secondary_range_name = "gke-primary-gke-cluster-pods-a7f64acd"

    pod_cidr_overprovision_config {
      disabled = false
    }

    services_ipv4_cidr_block = "34.118.224.0/20"
    stack_type               = "IPV4"
  }

  location = "us-central1"

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }

  maintenance_policy {
    recurring_window {
      end_time   = "1970-01-02T07:00:00Z"
      recurrence = "FREQ=WEEKLY;BYDAY=SA,SU"
      start_time = "1970-01-01T07:00:00Z"
    }
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  monitoring_config {
    advanced_datapath_observability_config {
      enable_metrics = false
    }

    enable_components = ["SYSTEM_COMPONENTS", "DAEMONSET", "DEPLOYMENT", "STATEFULSET", "JOBSET", "STORAGE", "HPA", "POD", "CADVISOR", "KUBELET", "DCGM"]

    managed_prometheus {
      enabled = true
    }
  }

  name    = "primary-gke-cluster"
  network = "projects/avathon-saas-runtime-setup/global/networks/main-vpc"

  network_policy {
    enabled  = false
    provider = "PROVIDER_UNSPECIFIED"
  }

  networking_mode = "VPC_NATIVE"

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

  node_locations = ["us-central1-a", "us-central1-c", "us-central1-f"]

  node_pool_defaults {
    node_config_defaults {
      logging_variant = "DEFAULT"
    }
  }

  node_version = "1.33.5-gke.1080000"

  notification_config {
    pubsub {
      enabled = false
    }
  }

  pod_security_policy_config {
    enabled = false
  }

  private_cluster_config {
    master_global_access_config {
      enabled = false
    }
  }

  project = "avathon-saas-runtime-setup"

  protect_config {
    workload_config {
      audit_mode = "BASIC"
    }

    workload_vulnerability_mode = "WORKLOAD_VULNERABILITY_MODE_UNSPECIFIED"
  }

  release_channel {
    channel = "REGULAR"
  }

  resource_labels = {
    goog-terraform-provisioned = "true"
    managed-by-cnrm            = "true"
  }

  security_posture_config {
    mode               = "BASIC"
    vulnerability_mode = "VULNERABILITY_MODE_UNSPECIFIED"
  }

  service_external_ips_config {
    enabled = false
  }

  subnetwork = "projects/avathon-saas-runtime-setup/regions/us-central1/subnetworks/main-subnet"
}
# terraform import google_container_cluster.primary_gke_cluster avathon-saas-runtime-setup/us-central1/primary-gke-cluster
