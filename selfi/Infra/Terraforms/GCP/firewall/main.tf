terraform {
 backend "gcs" {
   bucket  = "astrologyash"
   prefix  = "terraform/state/firewall"
 }
}

provider "google" {
  credentials = "${file(var.credentials)}"
  project     = "my-project-id"
  region      = "us-central1"
}

provider "google-beta" {
  credentials = "${file(var.credentials)}"
  project     = "my-project-id"
  region      = "us-central1"
}

locals {
firewall-egress-allow-https-any-to-any = "${var.vpc_name}-egress-allow-https-any-to-any"
firewall-egress-deny-all               = "${var.vpc_name}-egress-deny-all"
firewall-ingress-allow-http-any-to-pub = "${var.vpc_name}-ingress-allow-http-any-to-pub"
firewall-ingress-allow-http-to-priv    = "${var.vpc_name}-ingress-allow-http-to-priv"
firewall-ingress-deny-all              = "${var.vpc_name}-ingress-deny-all"
}
resource "google_compute_firewall" "global-firewall-egress-allow-http-any-to-any" {
  provider           = "google-beta"                                          # Required for enabling logging (enable_logging = true)
  name               = "${local.firewall-egress-allow-https-any-to-any}"
  description        = "FASM-ID : 2429/2431 - VPC allow HTTPS egress traffic"
  project            = "${var.project_id}"
  network            = "${var.vpc_name}"
  destination_ranges = ["0.0.0.0/0"]
  direction          = "EGRESS"
  enable_logging     = true                                                   # Feature in Beta (google-beta provider is required)
  priority           = "30000"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}

resource "google_compute_firewall" "global-firewall-egress-deny-all" {
  provider           = "google-beta"                       # Required for enabling logging (enable_logging = true)
  name               = "${local.firewall-egress-deny-all}"
  description        = "VPC deny egress All"
  project            = "${var.project_id}"
  network            = "${var.vpc_name}"
  destination_ranges = ["0.0.0.0/0"]
  direction          = "EGRESS"
  enable_logging     = true                                # Feature in Beta (google-beta provider is required)
  priority           = "65000"

  deny {
    protocol = "all"
  }
}

resource "google_compute_firewall" "global-firewall-ingress-allow-http-any-to-public" {
  provider       = "google-beta"                                                             # Required for enabling logging (enable_logging = true)
  name           = "${local.firewall-ingress-allow-http-any-to-pub}"
  description    = "FASM-ID : 2548/2549 - VPC allow HTTP ingress traffic from Any to Public"
  project        = "${var.project_id}"
  network        = "${var.vpc_name}"
  source_ranges  = ["0.0.0.0/0"]
  target_tags    = ["public"]
  direction      = "INGRESS"
  enable_logging = true                                                                      # Feature in Beta (google-beta provider is required)
  priority       = "30000"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}

resource "google_compute_firewall" "global-firewall-ingress-allow-http-to-private" {
  provider       = "google-beta"                                                                         # Required for enabling logging (enable_logging = true)
  name           = "${local.firewall-ingress-allow-http-to-priv}"
  description    = "FASM-ID : 2548/2549 - VPC allow HTTPS ingress traffic from Public/Private to Public"
  project        = "${var.project_id}"
  network        = "${var.vpc_name}"
  source_tags    = ["private", "public"]
  target_tags    = ["private"]
  direction      = "INGRESS"
  enable_logging = true                                                                                  # Feature in Beta (google-beta provider is required)
  priority       = "31000"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}

resource "google_compute_firewall" "global-firewall-ingress-deny-all" {
  provider       = "google-beta"                        # Required for enabling logging (enable_logging = true)
  name           = "${local.firewall-ingress-deny-all}"
  description    = "VPC deny ingress All"
  project        = "${var.project_id}"
  network        = "${var.vpc_name}"
  source_ranges  = ["0.0.0.0/0"]
  direction      = "INGRESS"
  enable_logging = true                                 # Feature in Beta (google-beta provider is required)
  priority       = "65000"

  deny {
    protocol = "all"
  }
}
