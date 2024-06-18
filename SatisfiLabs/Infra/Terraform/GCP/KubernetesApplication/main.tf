terraform {
  backend "gcs" {
    bucket = "satisfi-stage"
    prefix = "terraform/state/kubernetes1"
  }
}

provider "google" {
  credentials = file(var.credentials)
  project     = var.project_id
  region      = var.region
}

provider "google-beta" {
  credentials = file(var.credentials)
  project     = var.project_id
  region      = var.region
}

data "google_client_config" "default" {
}
/*
data "terraform_remote_state" "backend_gke" {
  backend = "gcs"
  config = {
    bucket = "satisfi-stage"
    prefix = "terraform/state/gke-new2"
  }
}
*/
provider "kubernetes" {
  version          = "1.10"
  load_config_file = "0"
  insecure         = "1"
  host             = "34.67.114.183"
  //host                   = "${data.terraform_remote_state.backend_gke.endpoint}"
  token = data.google_client_config.default.access_token
  //  client_certificate     = "${data.terraform_remote_state.}"
  //  client_key             = "${data.terraform_remote_state.client_key}"
  // cluster_ca_certificate = "${data.terraform_remote_state.backend_gke.ca_certificate}"
}

resource "kubernetes_deployment" "application-deployment" {
  metadata {
    name = var.application_name
    labels = {
      test = var.application_name
      app  = var.application_name
    }
  }
  spec {
    replicas = 3

    selector {
      match_labels = {
        app = var.application_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.application_name
        }
      }
      spec {
        container {
          image = var.application_image
          name  = var.application_name
          port {
            container_port = var.container_port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "application_services" {
  metadata {
    name = "${var.application_name}-service"
  }
  spec {
    selector = {
      app = var.application_name
    }
    port {
      port        = var.inner_port
      target_port = var.target_port
      protocol    = "TCP"
      name        = "http"
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_ingress" "application-ingress" {
  metadata {
    name = "${var.application_name}-ingress"
  }
  spec {
    backend {
      service_name = "${var.application_name}-service"
      service_port = var.application_port
    }
    rule {
      http {
        path {
          backend {
            service_name = "${var.application_name}-service"
            service_port = var.application_port
          }
          path = "/*"
        }
      }
    }
  }
}

