terraform {
  backend "gcs" {
    bucket = "satisfi-stage"
    prefix = "terraform/state/satisfi-stage1"
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

data "google_container_cluster" "gke_cluster" { 
 name = var.cluster_name
 location = var.region 
}

provider "kubernetes" {
  version          = "1.10"
  load_config_file = "0"
  insecure         = "1"
  host             = data.google_container_cluster.gke_cluster.endpoint
  token            = data.google_client_config.default.access_token
}

resource "kubernetes_deployment" "application-deployment" {
  metadata {
    name = var.application_name[var.envt]
    labels = {
      test = var.application_name[var.envt]
      app  = var.application_name[var.envt]
    }
  }
  spec {
    replicas = 1
    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge = "25%"
        max_unavailable = "25%"
      }
    }

    selector {
      match_labels = {
        app = var.application_name[var.envt]
      }
    }
    template {
      metadata {
        labels = {
          app = var.application_name[var.envt]
        }
      }
      spec {
        container {
          image = var.application_image
          name  = var.application_name[var.envt]
          termination_message_path = "/dev/termination-log"
          volume_mount {
            mount_path = "/usr/local/data"
            name = "satisfi-persistent-storage"
          }
         
          port {
            container_port = var.container_port
          }
        }
        /* volume {
          name = "satisfi-persistent-storage"
          persistent_volume_claim {
            claim_name = "fileserver-claim"
          }
        } */
      }
    }
  }
}

resource "kubernetes_service" "application_services" {
  metadata {
    name = "${var.application_name[var.envt]}-service"
  }
  spec {
    selector = {
      app = var.application_name[var.envt]
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
/*
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
*/

