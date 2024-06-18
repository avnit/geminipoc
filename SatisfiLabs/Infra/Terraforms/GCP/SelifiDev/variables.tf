variable "envt" { 
  type = "string" 
  default = "stage" 
}

variable "project_id" {
  type        = "map"
  description = "the project id of the project"
  default     = {
    "stage" = "satisfi-stage"
    "dev" = "satisfi-dev"
    "prod" = "satisfi-prod"
  }
}

variable "credentials" {
  type        = "map"
  description = "GCP credentials file"
  default     = {
    "stage" = "../satisfi-stage-fa7cb69d1b74.json"
    "dev"   = "../satisfi-dev-fa7cb69d1b74.json"
    "prod"  = "../satisfi-prod-fa7cb69d1b74.json"
}
}
variable "region" {
  description = "only run in one region for now for testing"
  default     = "us-central1"
}

variable "vpc_name" {
  type = "map"
  default = { 
    "stage" = "custom-network-satisfi-stage"
    "prod" = "custom-network-satisfi-prod"
    "dev" = "custom-network-satisfi-dev" 
  }
}
variable "cluster_name" {
  default = "gke-cluster-name"
}

variable "application_name" {
  type = "map"
  description = "The name of application"
  default     = {
    "stage" = "rivvit-stage-v1"
    "prod" = "rivvit-prod-v1"
    "dev" = "rivvit-dev-v1"
  }
}
variable "application_port" {
  description = "The port of application"
  default     = "80"
}

variable "inner_port" {
  description = "The inner port of application"
  default     = "80"
}

variable "target_port" {
  description = "The  target port of application"
  default     = "80"
}

variable "application_image" {
  description = "The name of application"
  default     = "gcr.io/satisfi-stage/rivvit:build-5"
}

variable "container_port" {
  description = "The  target port of application"
  default     = "80"
}

