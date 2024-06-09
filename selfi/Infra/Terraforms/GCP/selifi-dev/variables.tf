variable "envt" { 
  type = "string" 
  default = "stage" 
}

variable "project_id" {
  type        = "map"
  description = "the project id of the project"
  default     = {
    "stage" = "gvts-stage"
    "dev" = "gvts-dev"
    "prod" = "gvts-prod"
  }
}

variable "credentials" {
  type        = "map"
  description = "GCP credentials file"
  default     = {
    "stage" = "../gvts-stage-fa7cb69d1b74.json"
    "dev"   = "../gvts-dev-fa7cb69d1b74.json"
    "prod"  = "../gvts-prod-fa7cb69d1b74.json"
}
}
variable "region" {
  description = "only run in one region for now for testing"
  default     = "us-central1"
}

variable "vpc_name" {
  type = "map"
  default = { 
    "stage" = "custom-network-gvts-stage"
    "prod" = "custom-network-gvts-prod"
    "dev" = "custom-network-gvts-dev" 
}

variable "gke_cluster_name" {
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
  default     = "gcr.io/gvts-stage/rivvit:build-5"
}

variable "container_port" {
  description = "The  target port of application"
  default     = "80"
}

