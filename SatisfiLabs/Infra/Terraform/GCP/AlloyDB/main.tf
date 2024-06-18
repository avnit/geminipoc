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

resource "random_uuid" "name_seed" {
}

data "google_compute_network" "vpc" {
  name = var.vpc_name[var.envt]
}

resource "google_alloydb_cluster" "full" {
  cluster_id = "alloydb-cluster-full"
  location   = var.region
  network_config {
     network  = "projects/${var.project_id[var.envt]}/global/networks/${var.vpc_name[var.envt]}"
  }
  database_version = "POSTGRES_15"

  initial_user {
    user     = var.alloydb_user[var.envt]
    password = var.alloydb_password[var.envt]
  }

  continuous_backup_config {
    enabled              = true
    recovery_window_days = 14
  }

  automated_backup_policy {
    location      = var.region
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
      test = "alloydb-cluster-${random_uuid.name_seed.result}"
    }
  }

  labels = {
    test = "alloydb-cluster-${random_uuid.name_seed.result}"
  }
}


resource "google_compute_network" "default" {
  name = "satisfi-prod-subnetwork-data-alloydb"
}



resource "google_alloydb_instance" "alloydb" {
    cluster = "alloydb-cluster-full"
    instance_id = "alloydb-instance-${random_uuid.name_seed.result}"
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

    // Turn off SSL Requirements for troubleshooting purpose. Don't do it in prod. 
    # client_connection_config {
    #   ssl_config {
    #     ssl_mode = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
    #   }
    # }

    database_flags = {
      "google_columnar_engine.enabled" = "on"
      "google_columnar_engine.memory_size_in_mb" = 15625
      "google_columnar_engine.enable_auto_columarization" = "off"
      "google_columnar_engine.enable_vectorized_join" = "on"
    }
  depends_on = [ google_service_networking_connection.vpc_connection ]
}

resource "google_compute_global_address" "private_ip_alloc" {
  name= "alloydb-columnar"
  address_type = "INTERNAL"
  purpose = "VPC_PEERING"
  prefix_length = 16
  network = data.google_compute_network.vpc.id  
}

resource "google_service_networking_connection" "vpc_connection" {
  network = data.google_compute_network.vpc.id
  service = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]
  depends_on = [google_compute_global_address.private_ip_alloc]  
}
 