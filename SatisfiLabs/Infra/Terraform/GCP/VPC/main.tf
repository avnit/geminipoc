terraform {
  backend "gcs" {
    bucket = "satisfi-core" 
    prefix = "terraform/state"
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

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 9.1.0"

  project_id   = var.project_id[var.envt]
  network_name = format("%s-%s", "custom-network", var.project_id[var.envt])
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name           = "satisfi-core-subnetwork-data"
      subnet_ip             = "10.60.0.0/22"
      subnet_region         = var.region
      subnet_private_access = "true"
      subnet_flow_logs      = "false"
      description           = "data "
    },
    {
      subnet_name           = "satisfi-core-subnetwork-app"
      subnet_ip             = "10.62.0.0/22"
      subnet_region         = var.region
      subnet_private_access = "true"
      subnet_flow_logs      = "false"
      description           = "Application "
    },
    {
      subnet_name           = "satisfi-core-subnetwork-dmz"
      subnet_ip             = "10.64.0.0/22"
      subnet_region         = var.region
      subnet_private_access = "true"
      subnet_flow_logs      = "false"
      description           = "Application "
    },
  ]

  secondary_ranges = {
    satisfi-core-subnetwork-app = []
    satisfi-core-subnetwork-data = []
    satisfi-core-subnetwork-dmz  = []
  }
}

/*
locals {
my_apis_to_enable = ["compute.googleapis.com"]
}

resource "google_project_service" "my_enabled_api" {
  project            = "${var.project_id[var.envt]}"
  count              = "${length(local.my_apis_to_enable)}"
  service            = "${local.my_apis_to_enable[count.index]}"
  disable_on_destroy = false
}


resource "google_compute_network" "satisfi-custom-network" {
  // depends_on              = ["google_project_service.my_enabled_api"]
  provider                = google-beta
  name                    = "custom-network-${var.project_id[var.envt]}"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnetwork" {
  count = length(var.subnets)

  name                     = var.subnets[count.index]["subnet_name"]
  ip_cidr_range            = var.subnets[count.index]["subnet_ip"]
  region                   = var.subnets[count.index]["subnet_region"]
  private_ip_google_access = lookup(var.subnets[count.index], "subnet_private_access", "false")
  enable_flow_logs         = lookup(var.subnets[count.index], "subnet_flow_logs", "false")
  network                  = local.network_self_link
  project                  = var.project_id[var.envt]
  secondary_ip_range       = [for i in range(length(contains(keys(var.secondary_ranges), var.subnets[count.index]["subnet_name"]) == true ? var.secondary_ranges[var.subnets[count.index]["subnet_name"]] : [])) : var.secondary_ranges[var.subnets[count.index]["subnet_name"]][i]]
  description              = lookup(var.subnets[count.index], "description", null)
  depends_on               = [google_compute_network.network]
}




resource "google_compute_subnetwork" "satisfi-subnetwork-application" {
  depends_on    = [google_compute_network.satisfi-custom-network]
  name          = "${var.project_id[var.envt]}-subnetwork-application"
  project       = var.project_id[var.envt]
  region        = var.region
  network       = "custom-network-${var.project_id[var.envt]}"
  ip_cidr_range = "10.0.0.0/20"
  private_ip_google_access = "true"
  secondary_ip_range       =  [
    
  ]
}

resource "google_compute_subnetwork" "satisfi-subnetwork-data" {
  name          = "${var.project_id[var.envt]}-subnetwork-data-data"
  project       = var.project_id[var.envt]
  region        = var.region
  network       = "custom-network-${var.project_id[var.envt]}"
  ip_cidr_range = "10.4.0.0/20"
  depends_on               = [google_compute_network.satisfi-custom-network]
  private_ip_google_access = "true"
}

resource "google_compute_subnetwork" "satisfi-subnetwork-dmz" {
  name          = "${var.project_id[var.envt]}-subnetwork-dmz"
  project       = var.project_id[var.envt]
  region        = var.region
  network       = "custom-network-${var.project_id[var.envt]}"
  ip_cidr_range = "10.8.0.0/20"
  depends_on               = [google_compute_network.satisfi-custom-network]
  private_ip_google_access = "true"
}

*/