variable "project_id" {
  description = "the project id of the project"
  default     = "satisfi-stage"
}

variable "credentials" {
  description = "GCP credentials file"
  default     = "../satisfi-stage-fa7cb69d1b74.json"
}

variable "region" {
  description = "only run in one region for now for testing"
  default     = "us-central1"
}

variable "vpc_name" {
  default = "custom-network-satisfi-stage"
}

variable "gke_cluster_name" {
  default = "gke-cluster-name"
}

variable "application_name" {
  description = "The name of application"
  default     = "gke-satisfi-mvp"
}

variable "application_port" {
  description = "The port of application"
  default     = "8080"
}

variable "inner_port" {
  description = "The inner port of application"
  default     = "8080"
}

variable "target_port" {
  description = "The  target port of application"
  default     = "8080"
}

variable "application_image" {
  description = "The name of application"
  default     = "jenkins/jenkins:lts"
}

variable "container_port" {
  description = "The  target port of application"
  default     = "8080"
}

