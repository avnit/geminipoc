terraform {
 backend "gcs" {
   bucket  = "satisfi-core"
   prefix  = "terraform/state/alloydb"
 }
}

provider "google" {
  credentials = file(var.credentials[var.envt])
  project     = var.project_id[var.envt]
  region      = var.region
}


resource "google_alloydb_cluster" "full" {
  cluster_id = "alloydb-cluster-full"
  location   = "us-central1"
  network_config {
    network = google_compute_network.default.id
  }
  database_version = "POSTGRES_15"

  initial_user {
    user     = "alloydb-cluster-full"
    password = "alloydb-cluster-full"
  }

  continuous_backup_config {
    enabled              = true
    recovery_window_days = 14
  }

  automated_backup_policy {
    location      = "us-central1"
    backup_window = "1800s"
    enabled       = true

    weekly_schedule {
      days_of_week = ["MONDAY"]

      start_times {
        hours   = 23
        minutes = 0
        seconds = 0
        nanos   = 0
      }
    }

    quantity_based_retention {
      count = 1
    }

    labels = {
      test = "alloydb-cluster-full"
    }
  }

  labels = {
    test = "alloydb-cluster-full"
  }
}

data "google_project" "project" {}

resource "google_compute_network" "default" {
  name = "alloydb-cluster-full"
}

resource "google_alloydb_instance" "alloydb" {
    cluster = google_alloydb_cluster.full.cluster_id
    instance_id = "alloydb-${random_uuid.name_seed.result}"
    availability_type = "ZONAL"
    instance_type = "PRIMARY"

    machine_config {
      cpu_count = var.alloydb_cpu_count
    }

    query_insights_config {
      
      query_plans_per_minute = 20
      query_string_length = 4500
      record_application_tags =   true
      record_client_address = true
    }
}
